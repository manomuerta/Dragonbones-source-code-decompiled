package _953
{
   public class _963 extends _960
   {
      public function _963()
      {
         super();
      }
      
      override public function _5340() : void
      {
         super._5340();
         _2000 = _3286._4409[_2762];
      }
      
      public function set _3233(param1:Number) : void
      {
         if(_2000.width != param1)
         {
            _2000.width = param1;
            _6788();
         }
      }
      
      public function set _3231(param1:Number) : void
      {
         if(_2000.height != param1)
         {
            _2000.height = param1;
            _6788();
         }
      }
      
      public function get _4066() : uint
      {
         return _2000.bgColor;
      }
      
      public function set _4066(param1:uint) : void
      {
         if(_2000.bgColor != param1)
         {
            _2000.bgColor = param1;
            _6788();
         }
      }
   }
}

