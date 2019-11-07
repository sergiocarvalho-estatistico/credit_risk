# script name:
# plumber.R

# Defina o título e a descrição da API para aparecer em http://localhost:8888/__swagger__/

#' @apiTitle Risco de Retorno de Credito
#' @apiDescription Esta API usa dados socio-economico para estimar o valor a ser concedido a clientes com cadastro de credito aprovado. 

suppressMessages(library(caret))
suppressMessages(library(lattice))
suppressMessages(library(ggplot2))
#library(mongolite)

# load model
model_class = base::readRDS("modelos/classification_model.rds")
model_regression = base::readRDS("modelos/regression_model.rds")

# Conectando ao banco de dados
creditrisk = mongolite::mongo(collection = "scarvalho", 
                                      db = "creditrisk",
                                     url = "mongodb://localhost:27017/")


#' Retorna o total de credito concedido ao cliente caso ele tenha um bom score de risco
#' @param Married Digite uma das categorias: No, vnd ou Yes 
#' @param Education Digite uma das categorias: Graduate, Not Graduate
#' @param LoanAmount Digite um valor numerico
#' @param ApplicantIncome Digite um valor numerico 
#' @param CoapplicantIncome Digite um valor numerico
#' @param Loan_Amount_Term Digite um valor numerico
#' @param Credit_History Digite uma das categorias: 0 ou 1
#' @param Property_Area Digite uma das categorias: Rural, Semiurban, Urban
#' @get /predict
pred_class <- function(Married,Education,LoanAmount,ApplicantIncome,CoapplicantIncome,Loan_Amount_Term,Credit_History,Property_Area){
    
  #Married = 'No'
  #Education = 'Graduate'
  #ApplicantIncome = 360
  #CoapplicantIncome = 0
  #Loan_Amount_Term = 5900
  #LoanAmount = 4500
  #Credit_History = '1'
  #Property_Area = 'Urban'
       
   # Definindo o dataframe  
   input_data <<- data.frame(Married = factor(Married,levels = c("No","vnd","Yes")),
                              Education = factor(Education,levels = c("Graduate","Not Graduate")),
                              ApplicantIncome = as.numeric(ApplicantIncome),
                              CoapplicantIncome = as.numeric(CoapplicantIncome),
                              Loan_Amount_Term = as.numeric(Loan_Amount_Term),                              
                              LoanAmount = as.numeric(LoanAmount),
                              Credit_History = factor(Credit_History, levels = c("0","1")),
                              Property_Area = factor(Property_Area,levels = c("Rural","Semiurban","Urban")))


   # Predição do modelo de Classificação  
   Loan_Status <<- stats::predict(model_class, input_data)
   

   if(as.character(Loan_Status) == "Y"){
    
     # Ordenando as colunas 
     input_data <<- data.frame(input_data,
                           Pred_Status = factor(Loan_Status,levels = c("N","Y")))
    
      # Predict and return result
      valor <<- stats::predict(model_regression, input_data)
      valor <<- as.numeric(round(exp(valor),3))
      
      # Resultados a serem adicionados oa banco de dados      
      add = data.frame(CreditGranting  = Loan_Status,
                       LoanValue = valor,input_data[,-length(input_data)])
      
      # Add resultados ao DB creditrisk      
      creditrisk$insert(add)
      
      paste(" ---------------- Concessao de credito autorizada no valor de", valor, " ---------------- ")
    }
    else{ 
      
      # Resultados a serem adicionados oa banco de dados      
      add = data.frame(CreditGranting  = 'N',
                             LoanValue = 0,input_data)
      
      # Add resultados ao DB creditrisk      
      creditrisk$insert(add)

      paste(" ---------------- Concessao de credito nao autorizada ---------------- ") 
    }
   
    # Close DB creditrisk   
    #creditrisk$disconnect()

}

#' @post /return_predict
returnpred <- function(){
  
  creditrisk$find('{}')
  
}
 