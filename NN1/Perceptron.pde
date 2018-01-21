//Activation
float sign(float n){
  if(n>=0)
  return 1;
  else return -1;
}
class Perceptron{
  float[] weights;
  float lr = 0.0001;
  //Init weights
  Perceptron(int n){
    weights = new float[n];
    for(int i=0;i<weights.length;i++){
      weights[i] = random(-1,1);
    }
  }
  //Create guess, a.k.a feedforward
  float guess(float[] inputs)
  {
    float sum = 0;
    for(int i=0;i<weights.length;i++){
      sum+= inputs[i]*weights[i];  //weighted sum
    }
    float output = sign(sum);
    return output;
  }  
  
   void train(float[] inputs, float target){
    float guess = guess(inputs);
    float error = target - guess;
    //Tune weights
    for(int i=0;i<weights.length;i++){
      weights[i]+= lr * error * inputs[i];
    }
   }
   
   float guessY(float x){
     float m = -weights[0] / weights[1];
     float b = -weights[2] / weights[1];
     println(m,' ',b);
     return m*x+b;
     
     
   }
}