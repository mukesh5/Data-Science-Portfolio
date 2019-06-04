rankhospital <- function(state, outcome, num){
  if(outcome!='heart attack' && outcome!='heart failure' && outcome!='pneumonia')
  {
    stop('invalid outcome')
  }
  if(state %in% as.character(unique(df$State)) )
  {
    
  if(num=='best')
    num=1
  df = read.csv('outcome-of-care-measures.csv', stringsAsFactors = F)
  
  state_df = subset(df, State==state)
  
  if(outcome=='heart attack')
  {
    state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack!='Not Available')
    if(num!='worst' && nrow(state_df) < num)
      return(NA)
    
    state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),  state_df$Hospital.Name),]
    #print(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    if(num=='worst')
      num = nrow(state_df)
    return(state_df[num,]$Hospital.Name)      
  }
  else if(outcome=='heart failure')
  {
    state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure!='Not Available')
    
    if(num!='worst' && nrow(state_df) < num)
      return(NA)
    #print(order(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,  state_df$Hospital.Name))
    state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), state_df$Hospital.Name), ]
    #print(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    #print(state_df[3,]$Hospital.Name)
    if(num=='worst')
      num = nrow(state_df)
    return(state_df[num,]$Hospital.Name)      
  }
  else if(outcome=='pneumonia')
  {
    state_df = subset(state_df, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia!='Not Applicable')
    if(num!='worst' && nrow(state_df) < num)
      return(NA)
    
    state_df <- state_df[ order(as.numeric(state_df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),  state_df$Hospital.Name),]
    if(num=='worst')
      num = nrow(state_df)
    return(state_df[num,]$Hospital.Name)      
  }
  }
  else{
    stop('invalid state')
  }
  
}