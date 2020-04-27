class Carro{

   final velocidadeMaxima;
   int _velocidadeAtual;
   
   Carro(this.velocidadeMaxima);
   
  
   
   void set velocidadeAtual (int auxVelocidade){
     bool deltaValido = (_velocidadeAtual - auxVelocidade).abs()<=5;
      if((deltaValido ) && (auxVelocidade>=0 )){
       this._velocidadeAtual= auxVelocidade;
     }
   }
    int get velocidadeAtual{
     return this._velocidadeAtual;
   }

   int acelerar(){
      if(this._velocidadeAtual+5<= this.velocidadeMaxima){
            this._velocidadeAtual+=5;
      }else{
        this._velocidadeAtual=this.velocidadeMaxima;
      }
      return this._velocidadeAtual;
   }

   int frear(){
      if(this._velocidadeAtual-5>=0){
        this._velocidadeAtual-=5;
      }else{
        this._velocidadeAtual=0;
      }
      return this._velocidadeAtual;
   }

   bool estaNoLimite(){
      if(this._velocidadeAtual==this.velocidadeMaxima){
        return true;
      }else{
        return false;
      }
   }

    bool estaParado(){
    if(this._velocidadeAtual==0){
      return true;
    }else{
      return false;
    }
    }
    


}