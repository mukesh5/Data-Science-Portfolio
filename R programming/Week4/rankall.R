rankall <- function(outcome, num){
  tmp_list = list()
  i <- 0
  if(outcome!='heart attack' && outcome!='heart failure' && outcome!='pneumonia')
  {
    stop('invalid outcome')
  }
  else{
  
  df <- read.csv('outcome-of-care-measures.csv', stringsAsFactors = F)
  
  for(state in unique(df$State))
  {
    i <- i+1
    state_df = subset(df, State==state)
    tnum <- num
    if(num=='best')
      tnum=1
    
    if(outcome=='heart attack')
    {
      
      state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack!='Not Available')
      if(is.integer(tnum) && nrow(state_df) < tnum)
      {
        tmp_list[[i]] <- c(NA,state)
        next
      }
      
      state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),  state_df$Hospital.Name),]
    
      if(num=='worst')
        tnum = nrow(state_df)
      
  
      tmp_list[[i]] <- c(state_df[tnum,]$Hospital.Name,state)
      
    
    }
    else if(outcome=='heart failure')
    {
      state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure!='Not Available')

      if(is.integer(tnum) && nrow(state_df) < tnum)
      {
        tmp_list[[i]] <- c(NA,state)
        
        next
      }
      
      state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), state_df$Hospital.Name), ]
      
      if(num=='worst')
        tnum = nrow(state_df)
      
      tmp_list[[i]] <- c(state_df[tnum,]$Hospital.Name,state)
      
    }
    else if(outcome=='pneumonia')
    {
      state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia!='Not Available')
      if(is.integer(tnum) && nrow(state_df) < tnum)
      {
        tmp_list[[i]] <- c(NA,state)
        
        next
      }
      
      state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),  state_df$Hospital.Name),]
      if(tnum=='worst')
        tnum = nrow(state_df)
      tmp_list[[i]] <- c(state_df[tnum,]$Hospital.Name,state)
      
    }
  }
  
  
  }
  
  result <- do.call(rbind, tmp_list)
  output <- as.data.frame(result, row.names = result[, 2], stringsAsFactors = FALSE)
  names(output) <- c("hospital", "state")
  
  return(output)
}