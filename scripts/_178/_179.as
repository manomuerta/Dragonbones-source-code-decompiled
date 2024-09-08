package _178
{
   public final class _179 extends _198
   {
      public var name:String;
      
      public var frameRate:uint;
      
      public var _2715:Number;
      
      public var playTimes:int;
      
      public var tweenEasing:Number;
      
      public var autoTween:Boolean;
      
      public var _1735:int;
      
      public var _2738:Vector.<String>;
      
      private var _2740:Vector.<_200>;
      
      private var _2739:Vector.<_195>;
      
      public function _179()
      {
         super();
         this._2715 = 0;
         this.playTimes = 0;
         this.autoTween = true;
         this.tweenEasing = NaN;
         this._2738 = new Vector.<String>();
         this._2738.fixed = true;
         this._2740 = new Vector.<_200>();
         this._2740.fixed = true;
         this._2739 = new Vector.<_195>();
         this._2739.fixed = true;
      }
      
      public function get _2695() : Vector.<_200>
      {
         return this._2740;
      }
      
      public function get _1745() : Vector.<_195>
      {
         return this._2739;
      }
      
      override public function dispose() : void
      {
         var _loc1_:_200 = null;
         var _loc2_:_195 = null;
         super.dispose();
         this._2738.fixed = false;
         this._2738.length = 0;
         this._2738 = null;
         this._2740.fixed = false;
         for each(_loc1_ in this._2740)
         {
            _loc1_.dispose();
         }
         this._2740.fixed = false;
         this._2740.length = 0;
         this._2740 = null;
         this._2739.fixed = false;
         for each(_loc2_ in this._2739)
         {
            _loc2_.dispose();
         }
         this._2739.fixed = false;
         this._2739.length = 0;
         this._2739 = null;
      }
      
      public function _2741(param1:String) : _200
      {
         var _loc2_:int = int(this._2740.length);
         while(_loc2_--)
         {
            if(this._2740[_loc2_].name == param1)
            {
               return this._2740[_loc2_];
            }
         }
         return null;
      }
      
      public function _2742(param1:_200) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2740.indexOf(param1) < 0)
         {
            this._2740.fixed = false;
            this._2740[this._2740.length] = param1;
            this._2740.fixed = true;
         }
      }
      
      public function _1875(param1:String) : _195
      {
         var _loc2_:int = int(this._2739.length);
         while(_loc2_--)
         {
            if(this._2739[_loc2_].name == param1)
            {
               return this._2739[_loc2_];
            }
         }
         return null;
      }
      
      public function _2677(param1:_195) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2739.indexOf(param1) < 0)
         {
            this._2739.fixed = false;
            this._2739[this._2739.length] = param1;
            this._2739.fixed = true;
         }
      }
   }
}

