package _790
{
   import _1038._1037;
   import _1038._1039;
   import _127._131;
   import _51._70;
   import _51._79;
   import _636.ComicEvent;
   import _81._85;
   import _97._103;
   import flash.geom.Point;
   
   public class _808 extends _131
   {
      protected var _6092:_79;
      
      protected var _6090:_794;
      
      public function _808()
      {
         super();
         itemRenderer = _794;
      }
      
      public function dispose() : void
      {
      }
      
      public function _2907(param1:_79) : void
      {
         _103.addItem(param1);
         dataProvider._4016(param1);
      }
      
      public function get _5021() : _79
      {
         return this._6092 as _79;
      }
      
      public function set _5021(param1:_79) : void
      {
         if(this._6092 == param1)
         {
            return;
         }
         this._6092 = param1;
         var _loc2_:_794 = !!param1 ? _2474(this._6092) as _794 : null;
         if(this._6090 == _loc2_)
         {
            return;
         }
         this._6090 = _loc2_;
      }
      
      public function get _6091() : _1037
      {
         return dataProvider as _1037;
      }
      
      public function _5068(param1:Point = null) : void
      {
         var _loc5_:_794 = null;
         var _loc6_:_79 = null;
         var _loc7_:_70 = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:_1039 = dataProvider;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc5_ = _2490.getElementAt(_loc4_) as _794, _loc5_)
         {
            _loc6_ = _loc5_._1837;
            if((_loc7_ = _loc6_._2049) != null)
            {
               _loc8_ = _loc5_.globalToLocal(param1);
               _loc9_ = _loc7_.width / 2;
               _loc10_ = _loc7_.height / 2;
               if(_loc8_.x > -_loc9_ && _loc8_.x < _loc9_ && _loc8_.y > -_loc10_ && _loc8_.y < _loc10_)
               {
                  _loc11_ = _85._2185(_loc8_,_85._2189);
                  if(!_loc3_[0] || _loc11_ < _loc3_[0])
                  {
                     _loc3_[0] = _loc11_;
                     _loc3_[1] = _loc6_;
                  }
               }
            }
            _loc4_++;
         }
         if(_loc3_.length == 2)
         {
            this._6093(_loc3_[1] as _79);
         }
         else
         {
            this._6093(null);
         }
      }
      
      private function _6093(param1:_79) : void
      {
         if(this._6092 != param1)
         {
            dispatchEvent(new ComicEvent(ComicEvent.OUT_SLOT));
            if(param1)
            {
               dispatchEvent(new ComicEvent(ComicEvent.OVER_SLOT,param1));
            }
            this._6092 = param1;
         }
      }
   }
}

