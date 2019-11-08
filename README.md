# Instalação dos Pacotes

* Na pasta pacote_e_funcoes

      * Execute o arquivo instalarpacotes.R

# Leitura e execução dos códigos

Os documentos e códigos devem ser lidos e executados na seguinte ordem:

* Pasta docs
    * mapa_das_atividades.html
    * mapa_das_atividades.Rmd
* Pasta dataexplorer
    * dataprep.html
    * dataprep.Rmd        
* Pasta modelagem
    * ml_classification.html
    * ml_classification.Rmd        
* Pasta modelagem
    * ml_regression.html
    * ml_regression.Rmd

# Bonus 

Problemas na base de dados com dados missing para as seguintes variáveis:

<center>

|       Variável     |   Tipo   |   Qtde Missing  |
|:------------------:|:--------:|:---------------:|
|  Gender            | caracter |      13         |
|  Married           | caracter |      03         |
|  Dependents        | caracter |      15         |
|  Self_Employed     | caracter |      32         |
|  Credit_History    | Integer  |      50         |
|  Loan_Amount_Term  | Integer  |      14         |
|  LoanAmount  	 | Integer  |      22	     |   	

</center>  

Além disso a variável __Credit_History__ que tem a característíca de uma variável categórico, no entanto, o seu tipo de dado estava como integer.


# Aplicação da Serialização/API

Pasta aplicacao_docker

* Abra e execute o arquivo start_api.R
* Vá até o seu browser e digite: http://127.0.0.1:8000/__swagger__/

* Irá aparecer a seguinte tela:

<p align="center">
  <img src="https://github.com/sergiocarvalho-estatistico/credit_risk/blob/master/imagens/tela1.PNG" width="900" title="Primeira Tela" alt="accessibility text">
</p>

* Você irá clicar em:  

![get prediction](imagens/get_pred.png)

* Em seguida click em: Try it out

![Try out](imagens/try.png)

* Entre com os seguintes dados de exemplo:

  * Property_Area = Urban
  * Credit_History = 1
  * Loan_Amount_Term = 5900  
  * CoapplicantIncome = 0
  * ApplicantIncome = 360
  * LoanAmount = 4500
  * Education = Graduate
  * Married = No

<br>

* Click em Execute:
![Execute](imagens/execute.png)

Para ver os dados no banco de dados click em: 
![Post](imagens/post_pred.png)


# Aplicação Docker Local

Para rodar a aplicação docker faça o seguinte:

  * Em seu computador crie uma pasta com nome tmp em:
      * $\text{C:\Users\UserName>kmdir tmp}$
      * Copie o conteúdo da pasta __aplicacao_docker__ para a pasta tmp
      * Via prompt excute a seguinte linha de commando:
        * $\text{C:\Users\UserName>cd tmp}$
        * $\text{C:\Users\UserName\tmp>docker build -t credit_risk .}$
        * Após digitar o comando acima aguarde a instalação dos requisitos em seu sistema.
        * Uma fez finalizada a instalação digite:
        * $\text{C:\Users\UserName\tmp>docker run --rm -p 8000:8000 credit_risk}$  
    
    
        
    
