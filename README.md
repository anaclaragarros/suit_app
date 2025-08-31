# Gerenciamento de Limite de Crédito (Frontend)

Este é o projeto de frontend para o sistema de Gerenciamento de Limite de Crédito. Ele consome a API REST desenvolvida em Spring Boot para permitir que usuários consultem e atualizem limites de crédito, além de visualizar o histórico de alterações.

## 🚀 Tecnologias Utilizadas

* **Flutter**: Framework UI do Google para criar aplicativos nativos, compilados a partir de uma única base de código.
* **Dart**: Linguagem de programação otimizada para o desenvolvimento de aplicativos em Flutter.

---

## ✨ Funcionalidades do Aplicativo

* **Consulta de Limite**: Uma interface para buscar o limite de crédito de um cliente através do seu ID.
* **Atualização de Limite**: Uma tela para alterar o limite de crédito, com validações baseadas nas regras de negócio da API.
* **Visualização do Histórico**: Uma tela para exibir o histórico de alterações de limite de crédito.

---

## 🛠️ Como Executar o Projeto

1.  **Pré-requisitos**: Certifique-se de ter o **Flutter SDK** e o **Dart** instalados em seu ambiente.
2.  **Configuração da API**: Este aplicativo depende da API de backend. Certifique-se de que o projeto de backend esteja em execução. No seu código, verifique o arquivo de configuração onde a URL base da API é definida e atualize-a conforme o endereço do seu servidor.
3.  **Instalar Dependências**: Abra o terminal na pasta raiz do projeto e execute o comando:
    ```bash
    flutter pub get
    ```
4.  **Rodar a Aplicação**: Conecte um dispositivo físico ou inicie um emulador. Em seguida, execute a aplicação a partir do terminal:
    ```bash
    flutter run
    ```

---

## 🤝 Contribuições

Sinta-se à vontade para abrir **pull requests** ou **issues** para melhorias, novas funcionalidades ou correções de bugs.
