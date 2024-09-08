package _1146
{
   import _1148._1150;
   import _1155._1158;
   import _1162._1161;
   import _1174._1173;
   import _1177.EffectEvent;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1145 extends Effect
   {
      private var _8751:int = 0;
      
      private var _8761:_1158;
      
      private var _8758:Vector.<_1150>;
      
      private var _8755:_1173 = null;
      
      private var _8752:String = "loop";
      
      private var _8754:Boolean = false;
      
      public function _1145(param1:Object = null)
      {
         super(param1);
         _8757 = _1161;
      }
      
      public function get _3772() : _1158
      {
         return this._8761;
      }
      
      public function set _3772(param1:_1158) : void
      {
         this._8761 = param1;
      }
      
      public function get motionPaths() : Vector.<_1150>
      {
         return this._8758;
      }
      
      public function set motionPaths(param1:Vector.<_1150>) : void
      {
         this._8758 = param1;
      }
      
      public function get _8759() : _1173
      {
         return this._8755;
      }
      
      public function set _8759(param1:_1173) : void
      {
         this._8755 = param1;
      }
      
      public function get _8753() : String
      {
         return this._8752;
      }
      
      public function set _8753(param1:String) : void
      {
         this._8752 = param1;
      }
      
      public function get _8756() : Boolean
      {
         return this._8754;
      }
      
      public function set _8756(param1:Boolean) : void
      {
         this._8754 = param1;
      }
      
      override protected function _8760(param1:_1172) : void
      {
         var _loc3_:int = 0;
         super._8760(param1);
         var _loc2_:_1161 = _1161(param1);
         _loc2_.addEventListener(EffectEvent.EFFECT_REPEAT,this._8750);
         if(this._8751 > 0)
         {
            _loc2_.addEventListener(EffectEvent.EFFECT_UPDATE,this._8750);
         }
         _loc2_._3772 = this._3772;
         if(this._8759)
         {
            _loc2_._8759 = this._8759;
         }
         if(isNaN(repeatCount))
         {
            _loc2_.repeatCount = repeatCount;
         }
         _loc2_._8753 = this._8753;
         _loc2_._8756 = this._8756;
         if(this.motionPaths)
         {
            _loc2_.motionPaths = new Vector.<_1150>();
            _loc3_ = 0;
            while(_loc3_ < this.motionPaths.length)
            {
               _loc2_.motionPaths[_loc3_] = this.motionPaths[_loc3_].clone();
               _loc3_++;
            }
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            ++this._8751;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            --this._8751;
         }
      }
      
      private function _8750(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
      }
   }
}

