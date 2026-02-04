.PHONY: setup clean generate open

setup: clean generate open

clean:
	@echo "🧹 Limpando projeto..."
	rm -rf *.xcodeproj
	rm -rf DerivedData

generate:
	@echo "⚙️ Gerando projeto com XcodeGen..."
	xcodegen generate

open:
	@echo "🚀 Abrindo projeto..."
	open CineNow.xcodeproj