package _14201
{
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   
   public class _14214 extends _14199
   {
      private var _11956:Vector.<String>;
      
      public function _14214()
      {
         super("polygon");
      }
      
      public function get points() : Vector.<String>
      {
         return this._11956;
      }
      
      public function set points(param1:Vector.<String>) : void
      {
         this._11956 = param1;
         _15272();
      }
      
      override protected function _15288(param1:_14226) : void
      {
         var _loc2_:int = 0;
         if(this.points.length > 2)
         {
            param1.moveTo(Number(this.points[0]),Number(this.points[1]));
            _loc2_ = 2;
            while(_loc2_ < this.points.length - 1)
            {
               param1.lineTo(Number(this.points[_loc2_++]),Number(this.points[_loc2_++]));
            }
            param1.lineTo(Number(this.points[0]),Number(this.points[1]));
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14214 = super.clone(param1) as _14214;
         _loc2_.points = this.points.slice();
         return _loc2_;
      }
   }
}

