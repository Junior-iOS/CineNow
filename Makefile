setup:
	@echo "🛠 Generating Xcode project..."
	@xcodegen generate

	@echo "📦 Resolving Swift Packages..."
	@xcodebuild -resolvePackageDependencies

	@echo "✅ Setup completed!"