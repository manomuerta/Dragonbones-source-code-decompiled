package _755
{
   import _51._50;
   import _51._71;
   
   public class _756
   {
      public var dragonBonesVO:_71;
      
      public function _756()
      {
         super();
      }
      
      public static function _1572(param1:String, param2:String, param3:Number, param4:Vector.<_50>) : _756
      {
         var _loc6_:_50 = null;
         var _loc5_:_756;
         (_loc5_ = new _756()).dragonBonesVO = _71._1572(param1,param2,param3,param4);
         if(param4)
         {
            for each(_loc6_ in param4)
            {
               _loc6_._1751();
               _loc6_._1988();
            }
         }
         return _loc5_;
      }
      
      public function get version() : String
      {
         return this.dragonBonesVO.version;
      }
      
      public function get frameRate() : Number
      {
         return this.dragonBonesVO.frameRate;
      }
      
      public function get _2126() : Vector.<_50>
      {
         return this.dragonBonesVO._2126;
      }
   }
}

