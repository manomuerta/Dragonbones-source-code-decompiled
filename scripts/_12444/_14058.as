package _12444
{
   import _13492._13495;
   import _13503._13502;
   import _13505._13508;
   import _13505._13510;
   import _51._79;
   import _93._92;
   
   public class _14058 extends _92
   {
      public function _14058()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         _2223 = param1;
      }
      
      override protected function _2211() : *
      {
         return this._1992._1875(this._14415._1824);
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:_13510 = null;
         var _loc3_:_13495 = null;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         super.execute();
         _2213();
         if(_2208)
         {
            _loc1_ = int(this._1992._1745.indexOf(_2208));
            _loc2_ = this._14415._13572;
            _loc4_ = this._14415._1824;
            _loc5_ = 0;
            while(_loc5_ < _loc2_._1816.length)
            {
               _loc3_ = _loc2_._1816[_loc5_];
               _loc6_ = _loc3_._13613 == null ? -1 : _loc3_._13613.displayIndex;
               _loc7_ = _loc4_._1715;
               if(_loc6_ < 0 || _loc7_.length == 0)
               {
                  _loc3_.value = null;
               }
               else if(_loc6_ >= 0)
               {
                  _loc3_.value = _loc7_[_loc6_];
               }
               _loc5_++;
            }
            this._1992._1745[_loc1_] = this._14415;
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:_13508 = null;
         var _loc2_:int = 0;
         super.revert();
         if(_2208)
         {
            _loc1_ = this._1992._1875(this._14415._1824);
            _loc2_ = int(this._1992._1745.indexOf(_loc1_));
            this._1992._1745[_loc2_] = _2208;
         }
      }
      
      public function get _14415() : _13508
      {
         return _2223._14415;
      }
      
      public function get _1992() : _13502
      {
         return _2223._1992;
      }
   }
}

