package _543
{
   import _28._29;
   import _541._540;
   import _6._9;
   import _708._715;
   import _710._711;
   import _710._712;
   import _710._713;
   import _783.CommandNotification;
   import _874._873;
   import _97._115;
   
   public class _544
   {
      public var targets:Array;
      
      protected var _3943:_873;
      
      protected var _3944:_540;
      
      public function _544(param1:_873, param2:_540)
      {
         super();
         this._3943 = param1;
         this._3944 = param2;
      }
      
      public function _3935(param1:_29) : void
      {
         switch(param1.id)
         {
            case _713.SELECT_ALL:
               this._1567(new CommandNotification(param1.userData));
               break;
            case _713.DELETE:
            case _713.DELETE_SLOT:
               this._1567(new _9(param1.userData));
         }
      }
      
      public function _3937(param1:_711, param2:_712, param3:_715, param4:Array, param5:Number, param6:Number) : void
      {
         this.targets = param4;
         var _loc7_:Array = this._3943._3945(param1,param2,param3);
         if(_loc7_ == null)
         {
            return;
         }
         this._3941(_loc7_);
         this._3943._3937(_loc7_,param5,param6);
         this._3939();
      }
      
      protected function _3941(param1:Array) : void
      {
      }
      
      protected function _3939() : void
      {
         (_115._2364(_713.COPY_TRANSFORM) as _29).enabled = !this._3942;
         (_115._2364(_713.PASTE_TRANSFORM) as _29).enabled = !this._3942;
         (_115._2364(_713.DUPLICATE) as _29).enabled = !this._3942;
      }
      
      protected function _1567(param1:_9) : void
      {
         this._3944._1567(param1);
      }
      
      protected function get _3942() : Boolean
      {
         return Boolean(this.targets) && this.targets.length > 1;
      }
   }
}

