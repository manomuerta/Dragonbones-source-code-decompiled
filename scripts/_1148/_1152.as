package _1148
{
   public class _1152 extends _1150
   {
      public function _1152(param1:String = null, param2:Object = null, param3:Object = null, param4:Object = null)
      {
         super();
         this.property = param1;
         _8781 = new <_1149>[new _1149(0,param2),new _1149(NaN,param3,param4)];
      }
      
      public function get _8192() : Object
      {
         return _8781[0].value;
      }
      
      public function set _8192(param1:Object) : void
      {
         _8781[0].value = param1;
      }
      
      public function get _8198() : Object
      {
         return _8781[_8781.length - 1].value;
      }
      
      public function set _8198(param1:Object) : void
      {
         _8781[_8781.length - 1].value = param1;
      }
      
      public function get _8782() : Object
      {
         return _8781[_8781.length - 1]._8782;
      }
      
      public function set _8782(param1:Object) : void
      {
         _8781[_8781.length - 1]._8782 = param1;
      }
   }
}

