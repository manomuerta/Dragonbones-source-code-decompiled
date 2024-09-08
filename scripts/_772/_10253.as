package _772
{
   import _54._67;
   import _73._72;
   
   public class _10253 implements _774
   {
      public static const TYPE_APPEAR:int = 1;
      
      public static const TYPE_ACTION:int = 2;
      
      public static const TYPE_DISAPPEAR:int = 3;
      
      public var name:int = 44;
      
      public var type:int;
      
      public var _10368:int;
      
      public function _10253()
      {
         super();
      }
      
      public function set _2071(param1:_67) : void
      {
         if(param1.appear)
         {
            this.type = TYPE_APPEAR;
         }
         else if(param1._10283)
         {
            this.type = TYPE_DISAPPEAR;
         }
         else
         {
            this.type = TYPE_ACTION;
         }
         this._10368 = this._10367(param1.type);
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.type = this.type;
         _loc1_._10368 = this._10368;
         return _loc1_;
      }
      
      private function _10367(param1:_72) : int
      {
         switch(param1)
         {
            case _72.APPEAR_POSITION:
               return 1;
            case _72.APPEAR_ALPHA:
               return 2;
            case _72.APPEAR_SCALE:
               return 3;
            case _72.APPEAR_DROP:
               return 4;
            case _72.ALPHA:
               return 1;
            case _72.POSITION:
               return 2;
            case _72.ROTATION:
               return 3;
            case _72.SCALE:
               return 4;
            case _72.SWING:
               return 5;
            case _72.HEARTBEAT:
               return 6;
            case _72.SHAKE:
               return 7;
            case _72.TWINKLE:
               return 8;
            case _72.INVERT:
               return 9;
            case _72.DISAPPEAR_POSITION:
               return 1;
            case _72.DISAPPEAR_ALPHA:
               return 2;
            default:
               return 0;
         }
      }
   }
}

