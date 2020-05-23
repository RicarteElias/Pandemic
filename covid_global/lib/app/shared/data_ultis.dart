

class DataUtils{

static percentIndicator(int partialAmount , int totalAmount){
  double percent =  100 * partialAmount / totalAmount;
  return double.parse(percent.toStringAsFixed(1));
  }
  
}