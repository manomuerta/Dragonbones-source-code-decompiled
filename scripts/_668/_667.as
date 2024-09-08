package _668
{
   import _1038._1042;
   import _13503._13502;
   import _13545._13544;
   import _13545._13546;
   import _51._50;
   import _648._665;
   import _703._704;
   import _73.SymbolType;
   import _93._95;
   import flash.utils.Dictionary;
   
   public class _667 extends _95
   {
      private static var _5801:Dictionary = new Dictionary();
      
      private static var _5802:Dictionary = new Dictionary();
      
      private var _4133:_665;
      
      private var _2482:Object;
      
      public function _667()
      {
         super();
      }
      
      public function get _2871() : _665
      {
         return this._4133;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._4133 == param1)
         {
            return;
         }
         this._4133 = param1;
         if(!this._3997)
         {
            _5801[this._4133] = new _1042();
         }
         this._3997.source = this._5800();
         this._4540();
      }
      
      public function _3994() : void
      {
         this._3997.source = this._5800();
         this._4540();
      }
      
      private function _5800() : _13544
      {
         var _loc3_:_13502 = null;
         var _loc1_:_50 = this._4133._2865;
         var _loc2_:_13544 = _5802[_loc1_];
         if(_loc2_)
         {
            return _loc2_;
         }
         _loc2_ = _13544._3996(null,null);
         if(_loc1_._1811 == SymbolType.ARMATURE)
         {
            for each(_loc3_ in _loc1_._13619)
            {
               _loc2_.children.push(_13544._3996(_loc2_,_loc3_));
            }
         }
         else if(_loc1_._1811 == SymbolType.MC || _loc1_._1811 == SymbolType.STAGE)
         {
            for each(_loc3_ in _loc1_._13619)
            {
               _loc2_.children.push(_13546._3996(_loc2_,_loc3_));
            }
         }
         _loc2_.children.sortOn("name");
         _5802[_loc1_] = _loc2_;
         return _loc2_;
      }
      
      public function _3993() : Array
      {
         var _loc2_:_704 = null;
         var _loc3_:_13544 = null;
         var _loc1_:Array = [];
         if(Boolean(this._3997) && Boolean(this._3997.source))
         {
            _loc2_ = this._3997.source as _704;
            for each(_loc3_ in _loc2_.children)
            {
               _loc1_.push(_loc3_._1992);
            }
         }
         return _loc1_;
      }
      
      private function _4540() : void
      {
         this._3997._4529(this._3997.source);
      }
      
      public function get _3997() : _1042
      {
         return _5801[this._4133];
      }
      
      public function set autoRecordKeyFrame(param1:Boolean) : void
      {
         this._4133._2824.autoRecordKeyFrame = param1;
      }
      
      public function get autoRecordKeyFrame() : Boolean
      {
         return this._4133._2824.autoRecordKeyFrame;
      }
      
      public function _13925() : _13544
      {
         var _loc1_:_50 = this._4133._2865;
         return _5802[_loc1_];
      }
   }
}

