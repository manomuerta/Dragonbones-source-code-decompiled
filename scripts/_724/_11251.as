package _724
{
   import _11220._11219;
   import _859._860;
   import flash.geom.Rectangle;
   
   public class _11251 extends _725
   {
      private var _11383:_11219;
      
      public function _11251(param1:_11219)
      {
         super();
         this._11383 = param1;
         _name = this._11383.name;
         _path = _name;
         _5873 = _path;
         _2166 = -50;
         _2167 = -50;
         width = 100;
         height = 100;
         this._3144();
      }
      
      override public function _5735(param1:_860) : void
      {
      }
      
      public function get _11278() : _11219
      {
         return this._11383;
      }
      
      public function _5839() : void
      {
         _name = this._11383.name;
         _path = _name;
         _5873 = _path;
      }
      
      public function _3144() : void
      {
         if(this._11383 == null)
         {
            return;
         }
         var _loc1_:Rectangle = this._11383.AABB;
         width = _loc1_.width;
         height = _loc1_.height;
         _2166 = -width / 2;
         _2167 = -height / 2;
      }
   }
}

