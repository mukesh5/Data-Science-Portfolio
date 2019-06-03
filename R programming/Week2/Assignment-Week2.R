pollutantmean = function(directory, pollutant, id=1:332)
{
  data = data.frame()
  for(i in id){
    monitor = str_pad(i,3,'left','0')
    file = paste(monitor,'.csv',sep = '')

    df = read.csv(file)
    data = rbind(data,df)
    
  }

  return(mean(data[,pollutant], na.rm = T))
}

complete = function(directory, id=1:332)
{
  data = data.frame()
  for(i in id){
    monitor = str_pad(i,3,'left','0')
    file = paste(monitor,'.csv',sep = '')
    
    df = read.csv(file)
    njob = sum(complete.cases(df))
    tmp = data.frame(i,njob)
    data = rbind(data,tmp)
    
    
  }  
  
  return(data)
}
corr = function(directory, threshold=0)
{
  corr_vect = NULL
  
  for(i in 1:332){
    monitor = str_pad(i,3,'left','0')
    file = paste(monitor,'.csv',sep = '')
    
    df = read.csv(file)
    
    df = df[complete.cases(df),]
    if(nrow(df)> threshold){
      corr_vect = c(corr_vect, cor(df['nitrate'], df['sulfate']))
    }
    
  }
  
  return(corr_vect)
}