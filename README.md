# CineNow 🎬

Aplicativo de filmes usando a API do TMDB.

## 🚀 Como Configurar o Projeto

### 1. Clone o repositório
\`\`\`bash
git clone https://github.com/Junior-iOS/CineNow.git
cd CineNow
\`\`\`

### 2. Configure as chaves da API

1. Crie uma conta em [The Movie Database (TMDB)](https://www.themoviedb.org/)
2. Obtenha sua API Key em [Settings > API](https://www.themoviedb.org/settings/api)
3. Copie o arquivo de exemplo:
   \`\`\`bash
   cp Secrets.xcconfig.example "Config/Secrets.xcconfig"
   \`\`\`
4. Edite `Config/Secrets.xcconfig` e adicione suas chaves:
   \`\`\`
   TMDB_API_KEY = sua_chave_aqui
   \`\`\`

### 3. Abra o projeto no Xcode
\`\`\`bash
open CineNow.xcodeproj
\`\`\`

### 4. Build e rode! 🎉
Pressione `Cmd + R` para compilar e rodar o app.

## 📁 Estrutura do Projeto
- `App/` - Código principal do aplicativo
- `Core/` - Framework com modelos e lógica de negócio
- `Features/` - Features modulares

## 🔑 Variáveis de Ambiente Necessárias
- `TMDB_API_KEY` - Chave da API do TMDB
