package _648
{
   import _13503._13502;
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _73.SymbolType;
   import _73._74;
   import _81._88;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _13205
   {
      public function _13205()
      {
         super();
      }
      
      public static function _13279(param1:_50, param2:_71, param3:String, param4:int) : Rectangle
      {
         var _loc5_:_13502 = null;
         var _loc7_:_13502 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Rectangle = null;
         if(param3)
         {
            _loc5_ = param1._13656(param3);
         }
         var _loc6_:Rectangle = _13377(param1);
         if(param1._13619)
         {
            _loc8_ = 0;
            _loc9_ = int(param1._13619.length);
            while(_loc8_ < _loc9_)
            {
               _loc7_ = param1._13619[_loc8_];
               if(_loc7_)
               {
                  _loc10_ = _13378(param1,_loc7_);
                  _loc6_ = _13381(_loc6_,_loc10_);
               }
               _loc8_++;
            }
         }
         if(_loc5_)
         {
            _loc5_._1874();
            _loc5_._1858(param4);
         }
         param1._1988();
         param1._1751();
         return _loc6_;
      }
      
      private static function _13378(param1:_50, param2:_13502) : Rectangle
      {
         var _loc4_:int = 0;
         var _loc6_:Rectangle = null;
         param2._1874();
         var _loc3_:int = 0;
         var _loc5_:Rectangle = new Rectangle();
         _loc3_ = 0;
         _loc4_ = param2.duration;
         while(_loc3_ < _loc4_)
         {
            param2._1858(_loc3_);
            param1._1988();
            param1._1751();
            _loc6_ = _13377(param1);
            _loc5_ = _13381(_loc5_,_loc6_);
            _loc3_++;
         }
         param2._1868();
         return _loc5_;
      }
      
      private static function _13377(param1:_50) : Rectangle
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_79 = null;
         var _loc6_:_70 = null;
         var _loc7_:Matrix = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Rectangle = null;
         var _loc10_:Rectangle = null;
         var _loc11_:Rectangle = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Matrix = null;
         var _loc15_:Rectangle = null;
         var _loc5_:Rectangle = new Rectangle();
         if(param1._1811 == SymbolType.SHEET)
         {
            if(Boolean(param1._1780) && param1._1780.length > 0)
            {
               _loc4_ = param1._1780[0];
               _loc2_ = 0;
               _loc3_ = int(_loc4_._1715.length);
               while(_loc2_ < _loc3_)
               {
                  _loc6_ = _loc4_._1765[_loc4_._1715[_loc2_]];
                  if(_loc6_)
                  {
                     _loc7_ = new Matrix();
                     _88._2013(_loc6_.localTransform,_loc7_);
                     _loc8_ = _13380(_loc6_.width,_loc6_.height,_loc7_);
                     _loc5_ = _13381(_loc5_,_loc8_);
                  }
                  _loc2_++;
               }
            }
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = int(param1._1780.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1._1780[_loc2_];
               if(_loc4_._2049 != null)
               {
                  if(_loc4_._2049.type == _74.MESH)
                  {
                     if(_loc4_._2049._2112)
                     {
                        _loc9_ = _loc4_._2049.mesh.AABB;
                        _loc5_ = _13381(_loc5_,_loc9_);
                     }
                     else
                     {
                        _loc10_ = _loc4_._2049.mesh.AABB;
                        _loc11_ = _13379(_loc10_,_loc4_._2009);
                        _loc5_ = _13381(_loc5_,_loc11_);
                     }
                  }
                  else if(_loc4_._2049.type != _74.ARMATURE)
                  {
                     if(_loc4_._2049.type != _74.BOUNDINGBOX)
                     {
                        _loc12_ = _loc4_._2049.width;
                        _loc13_ = _loc4_._2049.height;
                        _loc14_ = _loc4_._2009;
                        _loc15_ = _13380(_loc12_,_loc13_,_loc14_);
                        _loc5_ = _13381(_loc5_,_loc15_);
                     }
                  }
               }
               _loc2_++;
            }
         }
         return _loc5_;
      }
      
      private static function _13380(param1:Number, param2:Number, param3:Matrix) : Rectangle
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Shape = new Shape();
         _loc5_.graphics.beginFill(0);
         _loc5_.graphics.drawRect(-param1 / 2,-param2 / 2,param1,param2);
         _loc5_.graphics.endFill();
         _loc5_.transform.matrix = param3;
         _loc4_.addChild(_loc5_);
         return _loc5_.getBounds(_loc4_);
      }
      
      private static function _13379(param1:Rectangle, param2:Matrix) : Rectangle
      {
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Shape = new Shape();
         _loc4_.graphics.beginFill(0);
         _loc4_.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
         _loc4_.graphics.endFill();
         _loc4_.transform.matrix = param2;
         _loc3_.addChild(_loc4_);
         return _loc4_.getBounds(_loc3_);
      }
      
      private static function _13381(param1:Rectangle, param2:Rectangle) : Rectangle
      {
         param1.top = param1.top < param2.top ? param1.top : param2.top;
         param1.bottom = param1.bottom > param2.bottom ? param1.bottom : param2.bottom;
         param1.left = param1.left < param2.left ? param1.left : param2.left;
         param1.right = param1.right > param2.right ? param1.right : param2.right;
         return param1;
      }
   }
}

