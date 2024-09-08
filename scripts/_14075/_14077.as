package _14075
{
   import _13503._13502;
   import _51._50;
   import _51._79;
   import _658.Mesh;
   import _724._725;
   import _81._83;
   import flash.geom.Matrix;
   
   public class _14077
   {
      private static var _instance:_14077;
      
      private var _14671:Object;
      
      public function _14077()
      {
         this.UNIT_MATRIX = new Matrix();
         this._14671 = {};
         super();
      }
      
      public static function get instance() : _14077
      {
         if(_instance == null)
         {
            _instance = new _14077();
         }
         return _instance;
      }
      
      public function _14669(param1:_50, param2:String, param3:Number) : _14076
      {
         if(this._14671[param1.name])
         {
            if(this._14671[param1.name][param2])
            {
               if(this._14671[param1.name][param2][param3] is _14076)
               {
                  return this._14671[param1.name][param2][param3] as _14076;
               }
            }
         }
         var _loc4_:_14076 = this._14672(param1,param2,param3);
         if(_loc4_)
         {
            if(this._14671[param1.name] == null)
            {
               this._14671[param1.name] = {};
            }
            if(this._14671[param1.name][param2] == null)
            {
               this._14671[param1.name][param2] = {};
            }
            this._14671[param1.name][param2][param3] = _loc4_;
         }
         return _loc4_;
      }
      
      public function clear() : void
      {
         this._14671 = {};
      }
      
      private function _14672(param1:_50, param2:String, param3:Number) : _14076
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13502 = null;
         var _loc7_:_13502 = null;
         var _loc8_:_14076 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(param1)
         {
            _loc7_ = param1._1977;
            _loc5_ = int(param1._13619.length);
            if(_loc5_ > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  if((param1._13619[_loc4_] as _13502).name == param2)
                  {
                     _loc6_ = param1._13619[_loc4_];
                     break;
                  }
                  _loc4_++;
               }
            }
            if(_loc6_)
            {
               _loc9_ = _loc6_.duration;
               _loc10_ = param3;
               if(_loc9_ > 0)
               {
                  _loc11_ = param3 / _loc9_;
                  if(_loc6_.playTimes == 0 || _loc6_.playTimes >= _loc11_)
                  {
                     _loc10_ = param3 % _loc9_;
                  }
               }
               if(_loc6_ != _loc7_)
               {
                  _loc6_._1874();
               }
               _loc6_._1858(_loc10_);
            }
            param1._1988();
            param1._1751();
            param1._14280();
            _loc8_ = this._14670(param1);
            if(_loc6_ != _loc7_)
            {
               if(_loc7_)
               {
                  _loc7_._1874();
               }
               else
               {
                  _loc6_._1868();
               }
            }
            param1._1988();
            param1._1751();
            return _loc8_;
         }
         return null;
      }
      
      private function _14670(param1:_50) : _14076
      {
         var _loc2_:_79 = null;
         var _loc4_:_725 = null;
         var _loc5_:Matrix = null;
         var _loc6_:_83 = null;
         var _loc9_:Mesh = null;
         var _loc3_:_14076 = new _14076();
         var _loc7_:int = 0;
         var _loc8_:int = int(param1._1780.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_ = param1._1780[_loc7_];
            if(_loc2_._2049 == null)
            {
               _loc3_._14667(_loc2_,null,null,null);
            }
            else
            {
               if(_loc2_._2049._2165)
               {
                  _loc9_ = _loc2_._2049.mesh;
                  if(_loc9_)
                  {
                     _loc3_._4242(_loc2_,_loc9_._14663,Vector.<int>(_loc9_._2709),_loc9_._14668);
                  }
               }
               _loc4_ = _loc2_._2049._2104;
               if(_loc2_._2112())
               {
                  _loc5_ = this.UNIT_MATRIX;
               }
               else
               {
                  _loc5_ = _loc2_._2009.clone();
               }
               _loc6_ = _loc2_._1926.clone();
               _loc3_._14667(_loc2_,_loc4_,_loc5_,_loc6_);
            }
            _loc7_++;
         }
         return _loc3_;
      }
   }
}

