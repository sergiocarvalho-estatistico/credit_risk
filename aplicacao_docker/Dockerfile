FROM rocker/r-ver:3.6.0
 
# install R packages
RUN R -e "install.packages(c('MASS','caret','plumber','lattice','ggplot2'))"
 
RUN install2.r mongolite remotes httr \
	&& installGithub.r metacran/cranlogs

COPY / /

EXPOSE 8000
 
# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "start_api.R"] 

