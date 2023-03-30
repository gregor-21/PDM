class Memory{

  static const operations = const ['%', 'x', '+', '-','/', '='];
  final _buffer = [ 0.0, 0.0];
  int _bufferIndice = 0;
  String _operacao = '';
  String _value ='0';
  bool _wipevalue = false;
  String _lastCommand = '';

  void applyCommand(String command){  
    if(command == 'AC'){  
      _allClear();
    }
    else if(operations.contains(command)){
      if(_estasubstituindoaOperacao(command)){ 
        _operacao=command;
        return;
      }
      _setOperation(command);
    }
    else{
     _addDigito(command);
    }
    _lastCommand = command;
  }
  _estasubstituindoaOperacao(String command){ 
    return operations.contains(_lastCommand) && operations.contains(command)  &&
    _lastCommand != '=' && command != '=';
    

  }
  _setOperation(String newOperation){ 
    bool ehIgual = newOperation == '=';
    if(_bufferIndice == 0 ){  
      if(!ehIgual){ 
        _operacao=newOperation;
        _bufferIndice = 1;
        _wipevalue = true;
      }
    }else{
      _buffer[0]= _calculate();
      _buffer[1]= 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0')? _value.split('.')[0]: _value;
      _operacao = (ehIgual ? '' : newOperation);
      _bufferIndice = ehIgual ? 0 : 1;
    }
      _wipevalue = !ehIgual;
    

  }
  _addDigito(String digito){ 
    final ehponto = digito == '.';
    final wipeValue = (_value == '0' && !ehponto) || _wipevalue;

    if(ehponto && _value.contains(',') && !wipeValue){  
      return;
    }
    final emptyValue = ehponto ? '0' : '';
    final currentValue = wipeValue? emptyValue :_value; 
    _value = currentValue + digito;
    _wipevalue = false;

    _buffer[_bufferIndice]= double.tryParse(_value)?? 0;
  }
  _allClear(){
    _value ='0';
    _buffer.setAll(0, [0.0, 0.0]);
    _operacao='';
    _wipevalue=false;
    _bufferIndice = 0;
  }
  _calculate(){ 
    switch(_operacao){  
      case '+': return _buffer[0] + _buffer[1];
      case '-': return _buffer[0] - _buffer[1];
      case 'x': return _buffer[0] * _buffer[1];
      case '/': return _buffer[0] / _buffer[1];
      case '%': return _buffer[0] % _buffer[1];
      default : return _buffer[0];
    }
  }
  String get value{ 
    return _value;
  }
}