package _755
{
   import _51._50;
   import _721._763;
   import _73.SymbolType;
   import flash.utils.Dictionary;
   
   public class _760
   {
      public var _5943:int = 0;
      
      public var _5942:int = 0;
      
      public var zoom:Number = 1;
      
      public var visibleFilter:_759;
      
      public var selectableFilter:_759;
      
      public var _4409:Dictionary;
      
      public function _760()
      {
         this._4409 = new Dictionary();
         super();
      }
      
      public static function _5935() : _760
      {
         var _loc1_:_760 = new _760();
         _loc1_.visibleFilter = new _759();
         _loc1_.selectableFilter = new _759();
         return _loc1_;
      }
      
      public static function _1630(param1:Object, param2:Vector.<_50> = null) : _760
      {
         var _loc4_:Object = null;
         var _loc5_:_50 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:_760 = new _760();
         _loc3_._5943 = param1.cX;
         _loc3_._5942 = param1.cY;
         _loc3_.zoom = param1.zoom;
         _loc3_.visibleFilter = _759._1630(param1.filter.visibleFilter);
         _loc3_.selectableFilter = _759._1630(param1.filter.selectableFilter);
         if(param2)
         {
            for each(_loc5_ in param2)
            {
               if(Boolean(param1.canvas) && param1.canvas.length > 0)
               {
                  _loc4_ = null;
                  _loc6_ = 0;
                  _loc7_ = int(param1.canvas.length);
                  while(_loc6_ < _loc7_)
                  {
                     if(Boolean(param1.canvas[_loc6_]) && param1.canvas[_loc6_].name == _loc5_.name)
                     {
                        _loc4_ = param1.canvas[_loc6_];
                     }
                     _loc6_++;
                  }
               }
               if(_loc5_._1811 == SymbolType.STAGE || _loc5_._1811 == SymbolType.COMIC)
               {
                  _loc3_._3285(_loc5_,!!_loc4_ ? _763._1572(_loc4_.width,_loc4_.height,_loc4_.color,0,0,false,true) : null);
               }
            }
         }
         return _loc3_;
      }
      
      public static function _1629(param1:_760) : Object
      {
         var _loc3_:_763 = null;
         var _loc4_:Object = null;
         var _loc2_:Object = {};
         _loc2_.cX = param1._5943;
         _loc2_.cY = param1._5942;
         _loc2_.zoom = Math.floor(param1.zoom * 100) / 100;
         _loc2_.filter = {
            "visibleFilter":_759._1629(param1.visibleFilter),
            "selectableFilter":_759._1629(param1.selectableFilter)
         };
         _loc2_.canvas = [];
         for(_loc4_ in param1._4409)
         {
            _loc3_ = param1._4409[_loc4_];
            _loc2_.canvas.push({
               "name":_loc4_.name,
               "width":_loc3_.width,
               "height":_loc3_.height,
               "color":_loc3_.bgColor
            });
         }
         return _loc2_;
      }
      
      public function _3285(param1:Object, param2:_763 = null) : void
      {
         if(param2 == null)
         {
            param2 = _763._5941();
         }
         this._4409[param1] = param2;
         param1._2000 = param2;
      }
   }
}

