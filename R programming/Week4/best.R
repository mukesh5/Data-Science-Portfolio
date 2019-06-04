best <- function(state, outcome){
  df <- read.csv('outcome-of-care-measures.csv',stringsAsFactors = F)
  #df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  #df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  #df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  if(outcome!='heart attack' && outcome!='heart failure' && outcome!='pneumonia')
  {
    stop('invalid outcome')
  }
 
  if(state %in% as.character(unique(df$State)) )
  {
    state_df <- subset(df, State==state)
    if(outcome=='heart attack')
    {
      state_df = state_df[order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)),]
      lowest_rate = state_df[1,]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
      low_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == lowest_rate)
      if(nrow(low_df)==1)
      {
        return(as.character(low_df$Hospital.Name))
      }
      else{
        low_df = low_df[order(low_df$Hospital.Name),]
        low_df = head(low_df,1)
        return(as.character(low_df$Hospital.Name))
      }
      }
    else if(outcome=='heart failure'){
      #state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- unfactor(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
      state_df = state_df[order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)),]
      #print(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
      lowest_rate = state_df[1,]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
      #print(lowest_rate)
      low_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == lowest_rate)
    
      if(nrow(low_df)==1)
      {
        return(as.character(low_df$Hospital.Name))
      }
      else{
        low_df = low_df[order(low_df$Hospital.Name),]
        
        low_df = head(low_df,1)
        return(as.character(low_df$Hospital.Name))
      }
    }
    else if(outcome=='pneumonia')
    {
      state_df = state_df[order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)),]
      lowest_rate = state_df[1,]$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
      low_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == lowest_rate)
      if(nrow(low_df)==1)
      {
        return(as.character(low_df$Hospital.Name))
      }
      else{
        low_df = low_df[order(low_df$Hospital.Name),]
        low_df = head(low_df,1)
        return(as.character(low_df$Hospital.Name))
      }
    }
  }
  else{
    stop('invalid state')
  }
}