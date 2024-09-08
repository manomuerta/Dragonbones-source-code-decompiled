package _692
{
   import _703._704;
   import _724._725;
   
   public class _691 extends _704
   {
      public var count:int;
      
      protected var _5831:_725;
      
      public function _691(param1:_725)
      {
         super();
         this._5831 = param1;
         this._3670 = param1;
      }
      
      public function _4188() : Boolean
      {
         return false;
      }
      
      override public function get name() : String
      {
         if(this._5831)
         {
            return this._5831.name;
         }
         return "noName";
      }
      
      public function get _4204() : _725
      {
         return this._3670 as _725;
      }
   }
}

