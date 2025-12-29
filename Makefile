S3_BUCKET ?= $(error S3_BUCKET is not set)
CLOUDFRONT_DISTRIBUTION_ID ?= $(error CLOUDFRONT_DISTRIBUTION_ID is not set)
AWS_REGION ?= us-east-1
HUGO_ENV ?= production

# Default target
.PHONY: all
all: clean build deploy invalidate

# Build the Hugo site
.PHONY: build
build:
	@echo "Building Hugo site..."
	hugo --minify --environment $(HUGO_ENV)

# Deploy to S3
.PHONY: deploy
deploy:
	@echo "Deploying to S3..."
	aws s3 sync public/ s3://$(S3_BUCKET)/ \
		--delete \
		--region $(AWS_REGION)

# Invalidate CloudFront cache
.PHONY: invalidate
invalidate:
	@echo "Invalidating CloudFront cache..."
	aws cloudfront create-invalidation \
		--distribution-id $(CLOUDFRONT_DISTRIBUTION_ID) \
		--paths "/*"

# Build and deploy without cache invalidation
.PHONY: quick-deploy
quick-deploy: build deploy

# Clean the public directory
.PHONY: clean
clean:
	@echo "Cleaning public directory..."
	rm -rf public/

# Run local development server
.PHONY: serve
serve:
	hugo server -D

# Show help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all          - Build, deploy, and invalidate (default)"
	@echo "  build        - Build the Hugo site"
	@echo "  deploy       - Sync public/ to S3"
	@echo "  invalidate   - Invalidate CloudFront cache"
	@echo "  quick-deploy - Build and deploy without invalidation"
	@echo "  clean        - Remove public/ directory"
	@echo "  serve        - Run Hugo development server"
