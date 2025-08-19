# 📱 Chef Delivery - App de Entrega

O **Chef Delivery** é um aplicativo de delivery construído em **SwiftUI**, estruturado com **TabView** para navegação entre Home e Busca. Na Home, o usuário encontra banners promocionais dinâmicos e uma lista de lojas com filtro por avaliação; já a Busca permite localizar as lojas pelo nome ou segmento (ex.: Japonês, Pizza, Mexicana). A Tela de Detalhes exibe informações do estabelecimento, como endereço, nota e cardápio, enquanto a Tela de Produto possibilita ajustar a quantidade desejada de itens e finalizar o pedido com confirmação imediata.

<p align="center">
  <img src="Assets/Tela_Login.png" width="150"/>
  <img src="Assets/Tela_Home.png" width="150"/>
  <img src="Assets/Tela_Home_Filtro.png" width="150"/>
  <img src="Assets/Tela_Loja.png" width="150"/>
  <img src="Assets/Tela_Produto.png" width="150"/>
  <img src="Assets/Tela_Pedido.png" width="150"/>
  <img src="Assets/Tela_Busca.png" width="150"/>
  <img src="Assets/Tela_Buscando.png" width="150"/>
</p>

## 🛠 Tecnologias Utilizadas

- Swift
- SwiftUI
- Arquitetura MVC (Model-View-Controller)
- MVVM (ViewModel — implementação em andamento)
- API REST (GET e POST via Apiary)
- Testes Unitários (XCTest)
- Testes E2E (end-to-end)
- URLSession e Alamofire (com async/await e completion handler)
- Swift Package Manager (dependência externa: Alamofire)
- TabView (navegação por abas)
- Mock de Dados para desenvolvimento e testes
- Componentização de views para reutilização

## 👨🏻‍💻 Como Usar o Aplicativo

- Baixe o projeto e abra com o Xcode.
- Execute o aplicativo em um simulador iOS ou iPhone físico.
- Na tela inicial, deslize o botão para acessar a **Home**.
- Explore as categorias, banners e lista de lojas disponíveis.
- Utilize o filtro para visualizar lojas com base em sua avaliação.
- Toque em uma loja para visualizar os detalhes e o cardápio.
- Selecione um produto, ajuste a quantidade desejada e envie seu pedido.
- Acesse a aba Busca para encontrar rapidamente uma loja específica.

## 📌 Observações

Este projeto foi desenvolvido com fins **educacionais**, como prática de desenvolvimento iOS moderno utilizando **SwiftUI** e uma arquitetura **MVC**, que está em evolução para para **MVVM**. O aplicativo integra com uma **API REST**, criada com o **Apiary**, e realiza requisições tanto do tipo **GET** (para listagem de dados) quanto **POST** (para envio de pedidos), utilizando `URLSession` e `Alamofire` com suporte a `async/await` e `completion handler`. Além disso, parte dos dados também pode ser simulada localmente via mocks, o que facilita testes e desenvolvimento.
