require File.dirname(__FILE__) + "/../../spec_helper"
require File.dirname(__FILE__) + "/../fixtures/classes"

describe "Method parameter binding for collections" do
  @matrix = {
    #Int32ArrArg, ObjectArrArg, IInterfaceArrArg, ParamsInt32ArrArg,
    #ParamsIInterfaceArrArg, ParamsCStructArrArg,
    #Int32ArgParamsInt32ArrArg, IInterfaceArgParamsIInterfaceArrArg,
    #IListOfIntArg, IListOfObjArg, ArrayArg, 
    #IEnumerableOfIntArg, IEnumeratorOfIntArg, IEnumerableArg,
    #IEnumeratorArg, ArrayListArg, IDictionaryOfObjectObjectArg,
    #IDictionaryOfIntStringArg
    "monkeypatched" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "ArrayInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "ArrayInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "HashInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => "IDictionaryOfObjectObjectArg", :IDictionaryOfIntStringArg => TE},
    "HashInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => "IDictionaryOfObjectObjectArg", :IDictionaryOfIntStringArg => TE},
    "ImplementsEnumerableInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "StringInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "StringInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[Fixnum]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => "Int32ArrArg", :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => "ParamsInt32ArrArg", :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => "IListOfIntArg", :IListOfObjArg => TE, :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => "IEnumerableOfIntArg", :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[Fixnum]Instance" => {:NoArg => AE, :Int32ArrArg => "Int32ArrArg", :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => "ParamsInt32ArrArg", :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => "IListOfIntArg", :IListOfObjArg => TE, :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => "IEnumerableOfIntArg", :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[Object]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[Object]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[IInterface]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => "IInterfaceArrArg", :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => "ParamsIInterfaceArrArg", :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[IInterface]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => "IInterfaceArrArg", :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => "ParamsIInterfaceArrArg", :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => "IInterfaceArgParamsIInterfaceArrArg", :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[CStruct]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => "ParamsCStructArrArg", :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Array[CStruct]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => "ParamsCStructArrArg", :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "ArrayListInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => "ArrayListArg", :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "ArrayListInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => "ArrayListArg", :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "Dictionary[Object,Object]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => "IDictionaryOfObjectObjectArg", :IDictionaryOfIntStringArg => TE},
    "Dictionary[Object,Object]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => "IDictionaryOfObjectObjectArg", :IDictionaryOfIntStringArg => TE},
    "Dictionary[Fixnum,String]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => "IDictionaryOfIntStringArg"},
    "TestListInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "TestListInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "TestListEnumeratorInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => TE, :IEnumeratorArg => "IEnumeratorArg", :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "TestListEnumeratorInstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => TE, :IEnumeratorArg => "IEnumeratorArg", :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "CStructInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => "ParamsCStructArrArg", :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => TE, :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "Int32Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => "ParamsInt32ArrArg", :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => "Int32ArgParamsInt32ArrArg", :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => TE, :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "IInterfaceInstance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => "ParamsIInterfaceArrArg", :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => "IInterfaceArgParamsIInterfaceArrArg", :IListOfIntArg => TE, :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => TE, :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Collections::Generic::List[Fixnum]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => "IListOfIntArg", :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => "IEnumerableOfIntArg", :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Collections::Generic::List[Fixnum]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => "IListOfIntArg", :IListOfObjArg => TE, :ArrayArg => TE, :IEnumerableOfIntArg => "IEnumerableOfIntArg", :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Collections::Generic::List[Object]InstanceEmpty" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "System::Collections::Generic::List[Object]Instance" => {:NoArg => AE, :Int32ArrArg => TE, :ObjectArrArg => TE, :IInterfaceArrArg => TE, :ParamsInt32ArrArg => TE, :ParamsIInterfaceArrArg => TE, :ParamsCStructArrArg => TE, :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => TE, :IListOfIntArg => TE, :IListOfObjArg => "IListOfObjArg", :ArrayArg => TE, :IEnumerableOfIntArg => TE, :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => TE, :ArrayListArg => TE, :IDictionaryOfObjectObjectArg => TE, :IDictionaryOfIntStringArg => TE},
    "NoArg" => {:NoArg => "NoArg", :Int32ArrArg => AE, :ObjectArrArg => AE, :IInterfaceArrArg => AE, :ParamsInt32ArrArg => "ParamsInt32ArrArg", :ParamsIInterfaceArrArg => "ParamsIInterfaceArrArg", :ParamsCStructArrArg => "ParamsCStructArrArg", :Int32ArgParamsInt32ArrArg => AE, :IInterfaceArgParamsIInterfaceArrArg => AE, :IListOfIntArg => AE, :IListOfObjArg => AE, :ArrayArg => AE, :IEnumerableOfIntArg => AE, :IEnumerableArg => AE, :IEnumeratorArg => AE, :ArrayListArg => AE, :IDictionaryOfObjectObjectArg => AE, :IDictionaryOfIntStringArg => AE, :OutInt32Arg => "OutInt32Arg"},
    "nil" => {:NoArg => AE, :Int32ArrArg => "Int32ArrArg", :ObjectArrArg => "ObjectArrArg", :IInterfaceArrArg => "IInterfaceArrArg", :ParamsInt32ArrArg => "ParamsInt32ArrArg", :ParamsIInterfaceArrArg => "ParamsIInterfaceArrArg", :ParamsCStructArrArg => "ParamsCStructArrArg", :Int32ArgParamsInt32ArrArg => TE, :IInterfaceArgParamsIInterfaceArrArg => "IInterfaceArgParamsIInterfaceArrArg", :IListOfIntArg => "IListOfIntArg", :IListOfObjArg => "IListOfObjArg", :ArrayArg => "ArrayArg", :IEnumerableOfIntArg => "IEnumerableOfIntArg", :IEnumerableArg => "IEnumerableArg", :IEnumeratorArg => "IEnumeratorArg", :ArrayListArg => "ArrayListArg", :IDictionaryOfObjectObjectArg => "IDictionaryOfObjectObjectArg", :IDictionaryOfIntStringArg => "IDictionaryOfIntStringArg", :OutInt32Arg => TE},
  }    
  
  before(:each) do
    @target = ClassWithMethods.new
    @target2 = RubyClassWithMethods.new
    @values = Helper.collection_args
    nil #extraneous puts statement?
  end
    
  @matrix.each do |input, results|
    Helper.run_matrix(results, input)
  end
end