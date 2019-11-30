# Instale os Softwares   

* [R Project for Statistical Computing](https://www.r-project.org/)
* [RStudio](https://rstudio.com/products/rstudio/download/)
* [Mongodb](https://www.mongodb.com/) 

# Download do github

Após fazer o download da pasta __credit_risk__ do github, abra a pasta e dê um click duplo em:

* credit_risk.Rproj

# Instalação dos Pacotes

* Na pasta __pacote_e_funcoes__

    * Execute o arquivo instalarpacotes.R

# Leitura e execução dos códigos

Os documentos e códigos devem ser lidos e executados na seguinte ordem:

* Pasta __docs__
    * mapa_das_atividades.html
    * mapa_das_atividades.Rmd
* Pasta __dataexplorer__
    * dataprep.html
    * dataprep.Rmd        
* Pasta __modelagem__
    * ml_classification.html
    * ml_classification.Rmd        
* Pasta __modelagem__
    * ml_regression.html
    * ml_regression.Rmd

# Bonus 

Problemas na base de dados com dados missing para as seguintes variáveis:

<p align="center">
   
|    __Variável__        | __Tipo__ |__Qtde Missing__ |
|:----------------------:|:--------:|:---------------:|
|  __Gender__            | caracter |      13         |
|  __Married__           | caracter |      03         |
|  __Dependents__        | caracter |      15         |
|  __Self_Employed__     | caracter |      32         |
|  __Credit_History__    | Integer  |      50         |
|  __Loan_Amount_Term__  | Integer  |      14         |
|  __LoanAmount__  	    | Integer  |      22	      |   	

</p>  

Além disso a variável __Credit_History__ que tem a característíca de uma variável categórico, no entanto, o seu tipo de dado estava como integer.


# Aplicação da Serialização/API

Pasta __aplicacao_docker__

* Abra e execute o arquivo start_api.R
* Vá até o seu browser e digite: http://127.0.0.1:8000/__swagger__/

* Irá aparecer a seguinte tela:

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/tela1.PNG" width="900" title="Primeira Tela" alt="accessibility text">
</p>

* Você irá clicar em:  

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/get_pred.PNG" width="900" title="Primeira Tela" alt="accessibility text">
</p>

* Em seguida click em: Try it out

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/try.PNG" width="900" title="Primeira Tela" alt="accessibility text">
</p>


* Entre com os seguintes dados de exemplo:

  * Property_Area = Urban
  * Credit_History = 1
  * Loan_Amount_Term = 360  
  * CoapplicantIncome = 0
  * ApplicantIncome = 2500
  * LoanAmount = 120
  * Education = Graduate
  * Married = Yes

<br>

* Click em Execute:

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/execute.PNG" width="900" title="Execute" alt="accessibility text">
</p>

Para ver os dados no banco de dados click em: 

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/post_pred.PNG" width="900" title="Post" alt="accessibility text">
</p>

# Aplicação Docker Local

Para rodar a aplicação docker faça o seguinte:

  * Em seu computador crie uma pasta com nome tmp em:
      * C:\Users\UserName>kmdir tmp
      * Copie o conteúdo da pasta __aplicacao_docker__ para a pasta tmp
      * Via prompt excute a seguinte linha de commando:
        * C:\Users\UserName>cd tmp
        * C:\Users\UserName\tmp>docker build -t credit_risk .
        * Após digitar o comando acima aguarde a instalação dos requisitos em seu sistema.
        * Uma fez finalizada a instalação digite:
        * C:\Users\UserName\tmp>docker run --rm -p 8000:8000 credit_risk  
    
    
        
    
