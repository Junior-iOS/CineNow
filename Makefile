.PHONY: setup clean generate open

setup: clean generate open

clean:
	@echo "🧹 Limpando projeto...\n"
	rm -rf *.xcodeproj
	rm -rf DerivedData

format:
	@echo "🎨 Formatando o código...\n"
	@Scripts/swiftformat.sh

generate:
	@echo "⚙️ Gerando projeto com XcodeGen...\n"
	xcodegen generate

open:
	@echo "🚀 Abrindo projeto..."
	open CineNow.xcodeproj