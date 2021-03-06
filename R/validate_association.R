validate_association <-
function(entity.attribute, message=TRUE){
  ### should have 2 columns
  err.msg <- 'The entity attribute structure must have only 2 columns: first representing the entities (genes) and the second the attributes !'
  if(is.null(dim(entity.attribute)) ){
  	stop(err.msg)	
  }	else {
  	if( dim(entity.attribute)[2]!=2) stop(err.msg)
  }	

  ### should have no NA or NULL
  if(sum(is.null(as.vector(entity.attribute)))>0 | sum(is.na(as.vector(entity.attribute)))>0){
  	stop('The entity attribute structure must have no NULL or NA values !')	
  }	
  
  if(nrow(unique(entity.attribute)) != nrow(entity.attribute)){
  	stop('Found duplicate attributes for same entity !')	
  }
  if(message) print('Validation OK!')
  TRUE
}
