module LearningMachine	

	# exports 
    export BaseRegressor

	if Sys.islinux()	
		try	
			#run(`ls -la`)
			run(`sudo apt update`)
			run(`sudo apt upgrade`)
			run(`sudo apt install r-base r-base-dev -y`)
			run(`sudo apt install libcurl-dev`)
			run(`sudo apt install curl`)
			run(`sudo apt-get install libcurl4-openssl-dev`)
			run(`sudo apt install gfortran`)					
			run(`Rscript --version`)
			#username = strip(chomp(read(`whoami`, String)))
			#run(`sudo chown -R $username:$username /usr/local/lib/R/site-library`) # check permissions
		catch e
			println("Either R is already installed, or can't be installed on this machine (check manually: https://cloud.r-project.org/)")
		end 
	end	

	if Sys.isapple()
		try
			run(`brew update`)
			run(`brew install gcc`) # for gfortran
			run(`brew install r`)
			run(`Rscript --version`)
		catch e
			println("Either R is already installed, or can't be installed on this machine (check manually: https://cloud.r-project.org/)")
		end
	end

	if Sys.iswindows()
		try
			run(`Rscript --version`)
		catch e
			println("Either R is already installed, or can't be installed on this machine (check manually: https://cloud.r-project.org/)")
		end
	end
	
	if Sys.isapple() || Sys.islinux() || Sys.iswindows()
		# Run the `which R` command to get the path to the R executable
		output = strip(chomp(read(`which R`, String)))
		# Check if the output is not an empty string (R executable path found)
		if output != ""
			# Set the obtained R executable path to ENV["R_HOME"]
			ENV["R_HOME"] = output
			println("R_HOME is: ", ENV["R_HOME"])
		else
			println("R executable not found on this machine. Please install R (https://cloud.r-project.org/) and try again.")
		end
	end

	using RCall

	if Sys.islinux()
		try 
			username = strip(chomp(read(`whoami`, String)))
			run(`sudo usermod -aG staff $username`)
		catch e
			println("Can't define as staff")
		end
	end

	if Sys.islinux()
		try	
			run(`sudo Rscript -e "utils::install.packages('remotes', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`sudo Rscript -e "utils::install.packages('curl', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`sudo Rscript -e "utils::install.packages('e1071', repos='https://cran.rstudio.com', dependencies=TRUE)"`)			            
			run(`sudo Rscript -e "utils::install.packages('ranger', repos='https://cran.rstudio.com', dependencies=TRUE)"`)			
            run(`sudo Rscript -e "utils::install.packages('foreach', repos='https://cran.rstudio.com', dependencies=TRUE)"`)	
			run(`sudo Rscript -e "utils::install.packages('Rcpp', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`sudo Rscript -e "utils::install.packages('snow', repos='https://cran.rstudio.com', dependencies=TRUE)"`)						
			run(`sudo Rscript -e "utils::install.packages('tseries', repos='https://cran.rstudio.com', dependencies=TRUE)"`)			
			run(`sudo Rscript -e "utils::install.packages('learningMachine', repos='https://techtonique.r-universe.dev', dependencies=TRUE)"`)
		catch e1		
			try 
				run(`sudo Rscript -e "install.packages('remotes', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`sudo Rscript -e "install.packages('curl', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`sudo Rscript -e "install.packages('e1071', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`sudo Rscript -e "install.packages('ranger', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)				
				run(`sudo Rscript -e "install.packages('foreach', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`sudo Rscript -e "install.packages('Rcpp', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`sudo Rscript -e "install.packages('snow', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`sudo Rscript -e "install.packages('tseries', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`sudo Rscript -e "utils::install.packages('learningmachine', repos='https://techtonique.r-universe.dev', lib= '.', dependencies=TRUE)"`)
			catch e2
				println("Done trying to install R packages")
			end 
		finally 
			println("Done trying to install R packages")
		end	
	end

	if Sys.isapple() || Sys.iswindows()
		try	
			run(`Rscript -e "utils::install.packages('remotes', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`Rscript -e "utils::install.packages('curl', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`Rscript -e "utils::install.packages('e1071', repos='https://cran.rstudio.com', dependencies=TRUE)"`)				
			run(`Rscript -e "utils::install.packages('ranger', repos='https://cran.rstudio.com', dependencies=TRUE)"`)							
			run(`Rscript -e "utils::install.packages('foreach', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`Rscript -e "utils::install.packages('Rcpp', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`Rscript -e "utils::install.packages('snow', repos='https://cran.rstudio.com', dependencies=TRUE)"`)						
			run(`Rscript -e "utils::install.packages('tseries', repos='https://cran.rstudio.com', dependencies=TRUE)"`)
			run(`Rscript -e "utils::install.packages('learningmachine', repos='https://techtonique.r-universe.dev', dependencies=TRUE)"`)
		catch e1		
			try 
				run(`Rscript -e "install.packages('remotes', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`Rscript -e "install.packages('curl', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`Rscript -e "install.packages('e1071', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`Rscript -e "install.packages('ranger', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)	
				run(`Rscript -e "install.packages('foreach', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`Rscript -e "install.packages('Rcpp', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`Rscript -e "install.packages('snow', repos='https://cran.rstudio.com', lib= '.', dependencies=TRUE)"`)
				run(`Rscript -e "utils::install.packages('learningmachine', repos='https://techtonique.r-universe.dev', lib= '.', dependencies=TRUE)"`)
			catch e2
				println("Done trying to install R packages")
			end 
		finally 
			println("Done trying to install R packages")
		end	
	end
		
	R"""
	load_LearningMachine <- NULL
	load_learningmachine2 <- NULL
	load_learningmachine3 <- NULL
	load_learningmachine4 <- NULL

	load_learningmachine <- try(library('learningmachine'),
					silent = TRUE)

	if (inherits(load_learningmachine, 'try-error'))
	{
	load_learningmachine2 <- try(library('learningmachine',
								lib.loc = '.'),
						silent = TRUE)
	}

	if (inherits(load_learningmachine2, 'try-error')) {
	try(utils::install.packages(c('foreach', 'snow', 'Rcpp'), 
								dependencies = TRUE), 
		silent = TRUE)
	try(utils::install.packages("learningmachine", 
								dependencies = TRUE,
								repos = 'https://techtonique.r-universe.dev'),
		silent = TRUE)
	load_learningmachine3 <- try(library('learningmachine'),
						silent = TRUE)
	} 

	if (inherits(load_learningmachine3, 'try-error')) {
	try(utils::install.packages(c('foreach', 'snow', 'Rcpp'), 
								dependencies = TRUE, lib='.'), 
		silent = TRUE)
	try(utils::install.packages("learningmachine", 
								dependencies = TRUE,
								repos = 'https://techtonique.r-universe.dev', lib = '.'),
		silent = TRUE)
	load_learningmachine4 <- try(library('learningmachine', 
								dependencies = TRUE,
								lib.loc = '.'),
						silent = TRUE)
	} 

	list_err <- list(load_learningmachine, load_learningmachine2, load_learningmachine3, load_learningmachine4)

	if (all(sapply(list_err, function(x) inherits(x, 'try-error')))) {
	stop(
		'Please install the learningmachine package (first) manually from https://techtonique.r-universe.dev)'
	)
	}  
	"""

    function BaseRegressor()
        R"""
    	library(learningmachine)
    	learningmachine::BaseRegressor$new()
    	"""
    end
	
end

