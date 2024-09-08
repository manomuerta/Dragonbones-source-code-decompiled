package _724
{
   import _51._50;
   import _859._860;
   
   public class _723 extends _725
   {
      private var _3251:_50;
      
      public function _723(param1:_50)
      {
         super();
         this._3251 = param1;
         _name = this._3251.name;
         _path = _name;
         _5873 = _path;
      }
      
      override public function _5735(param1:_860) : void
      {
         super._5735(param1);
         param1._5724 = this._3251;
      }
      
      public function get _1886() : _50
      {
         return this._3251;
      }
      
      public function _5839() : void
      {
         _name = this._3251.name;
         _path = _name;
         _5873 = _path;
      }
   }
}

