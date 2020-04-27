class Data{

  int dia;
  int mes;
  int ano;
  
  String  obter(){
    return ("$dia/$mes/$ano");
  }

  String toString(){
    return obter();
  }

  Data([this.dia=1, this.mes=1, this.ano=1970]);
  Data.com({this.dia=1,this.mes=1,this.ano=1970});

  
}

main(){
var dataAniversario =  new Data(3,1,2020);



    Data dataCompra = new Data(23,12,2021);



    //print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");
    //print("${dataCompra.dia}/${dataCompra.mes}/${dataCompra.ano}");

    //dataCompra.obter();
    //dataAniversario.obter();
    print(dataCompra);
    print(dataCompra);
    print(Data.com(ano:2021));

}