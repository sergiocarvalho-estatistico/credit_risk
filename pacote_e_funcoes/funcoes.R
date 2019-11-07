importance.vars <- function(df,var){
  
  Y <- df[!is.na(df[,var]),var]
  X <- df[!is.na(df[,var]), colnames(df) != var ]
  
  
  suppressMessages(library(infotheo))
  MI = 100*(apply(X,2,function(u) mutinformation(Y,u)/entropy(Y)) %>%  
              as.table(MI) %>% 
              sort(decreasing = T)) 
  
  bar <- MI %>% as.data.frame
  
  colnames(bar) <- c('variavel',"MI")
  
  ggplot(bar, aes(variavel,y = MI)) +
    geom_linerange(aes(x = variavel, 
                       ymin = 0, 
                       ymax = MI),
                   color = "black", 
                   size = 0.4, 
                   lty = 3) +
    geom_point(aes(color = variavel), size = 3) +
    geom_text(aes(label = paste(round(MI,2),"%")), 
              vjust = -0.8,
              position = position_dodge(width = 1), size = 5.5) +
    labs(y = " ",
         x =" ",
         title = paste('\n Informacao Mutua para Variavel',var,'\n'),
         color = "Variáveis") +
    scale_y_continuous(limits = range(0,1.1*max(bar$MI))) +
    theme_dark() +
    scale_fill_discrete(guide = guide_legend()) + 
    theme(plot.title = element_text(hjust = 0.5,size = 20),legend.position="nome") +
    theme(axis.text.x = element_text(angle = 55, hjust = 1, size = 15))
  
}

# Teste curva Roc
#model = model_list[[3]]
#data = test_data
#target = 'Loan_Status'
test_roc <- function(model, data, target){
  
  roc(data[,target],
      predict(model, data, type = "prob")$'Y')
  
}


suppressMessages(library(parallel))
suppressMessages(library(doParallel))
# Programação paralela
start.cluster<-function(){
  
  
  (cluster <- makeCluster(detectCores() - 1)) # convention to leave 1 core for OS
  registerDoParallel(cluster)
  
  return(cluster)
}


stop.Cluster <- function(cluster){
  
  stopCluster(cluster)
  registerDoSEQ()
}  





