package _413
{
   import _13492._13496;
   import _13505._13510;
   import _1404._1407;
   import _555._557;
   import _93._92;
   
   public class _455 extends _92
   {
      private var deleteFrames:Vector.<_13496>;
      
      public function _455()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13496 = null;
         var _loc1_:_13510 = this.data._1945;
         var _loc2_:Array = this.data.frames;
         var _loc3_:int = this.data.delta;
         _loc4_ = 0;
         _loc5_ = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_] as _13496;
            if(_loc6_)
            {
               _loc6_.startPos += _loc3_;
            }
            _loc4_++;
         }
         var _loc7_:Object = {};
         this.deleteFrames = new Vector.<_13496>();
         _loc4_ = 0;
         _loc5_ = int(_loc1_._1816.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc1_._1816[_loc4_];
            if(_loc7_[_loc6_.startPos] == null)
            {
               _loc7_[_loc6_.startPos] = _loc6_;
            }
            else
            {
               _loc6_ = _loc7_[_loc6_.startPos];
               if(_loc2_.indexOf(_loc6_) == -1)
               {
                  _loc7_[_loc6_.startPos] = _loc1_._1816[_loc4_];
                  this.deleteFrames.push(_loc6_);
               }
               else
               {
                  this.deleteFrames.push(_loc1_._1816[_loc4_]);
               }
            }
            _loc4_++;
         }
         if(this.deleteFrames.length > 0)
         {
            _loc1_._1816.length = 0;
            for each(_loc6_ in _loc7_)
            {
               _loc1_._1816.push(_loc6_);
            }
         }
         _loc1_._13685();
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13496 = null;
         var _loc1_:_13510 = this.data._1945;
         var _loc2_:Array = this.data.frames;
         var _loc3_:int = this.data.delta;
         _loc4_ = 0;
         _loc5_ = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_] as _13496;
            if(_loc6_)
            {
               _loc6_.startPos -= _loc3_;
            }
            _loc4_++;
         }
         if(Boolean(this.deleteFrames) && this.deleteFrames.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this.deleteFrames.length);
            while(_loc4_ < _loc5_)
            {
               _loc1_._1816.push(this.deleteFrames[_loc4_]);
               _loc4_++;
            }
         }
         _loc1_._13685();
         this._2894();
      }
      
      private function get data() : _456
      {
         return _2223 as _456;
      }
      
      private function _2894() : void
      {
         this._3431._3432();
      }
      
      protected function get _3431() : _557
      {
         return _1407.getInstance(_557) as _557;
      }
   }
}

