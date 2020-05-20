

class DataUtils{

static percentIndicator(double partialAmount , double totalAmount){
  double percent =  100 * partialAmount / totalAmount;
  return double.parse(percent.toStringAsFixed(2));
  }
  
}