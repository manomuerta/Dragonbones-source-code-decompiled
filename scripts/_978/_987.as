package _978
{
   import _1045.Group;
   import _1045._1082;
   import _97._100;
   
   public class _987 extends Group
   {
      public var bg:_1082;
      
      private var _6951:int;
      
      private var _6950:int = 23;
      
      private var _6953:int;
      
      private var _6954:int;
      
      private var _6895:int = 1;
      
      private var _6894:int;
      
      private var _6963:Vector.<_1082>;
      
      public function _987()
      {
         super();
         this._6963 = new Vector.<_1082>();
         this._6953 = _988.MAX_GAP;
         this.bg = new _1082();
      }
      
      override protected function _2438() : void
      {
         this.bg._2529 = 0;
         this.bg.width = this._6951;
         this.bg.height = this._6950;
         addElement(this.bg);
         super._2438();
      }
      
      public function set _6905(param1:int) : void
      {
         if(this._6950 != param1)
         {
            this._6950 = param1;
            this._6916 = this._6951;
         }
      }
      
      public function refresh() : void
      {
         this._6916 = this._6951;
      }
      
      private function _6962() : _1082
      {
         var _loc1_:_1082 = null;
         _loc1_ = new _1082();
         _loc1_.mouseEnabled = false;
         _loc1_.width = 1;
         _loc1_.fillColor = _100.TIMELINE_LABEL_COLOR;
         addElement(_loc1_);
         return _loc1_;
      }
      
      public function get _6916() : int
      {
         return this._6951;
      }
      
      public function set _6916(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this._6951 = param1;
         this.bg.width = this._6951;
         this.bg.height = this._6950;
         if(this._6954 % (this._6895 * this._6894) > 0)
         {
            _loc6_ = (this._6895 * this._6894 - this._6954 % (this._6895 * this._6894)) / this._6894 * this._6953;
         }
         _loc2_ = this._6953 * this._6895;
         var _loc3_:int = Math.ceil(this._6951 / _loc2_);
         var _loc4_:int = int(this._6963.length);
         if(_loc3_ > _loc4_)
         {
            _loc7_ = 0;
            _loc8_ = _loc3_ - _loc4_;
            while(_loc7_ < _loc8_)
            {
               this._6963.push(this._6962());
               _loc7_++;
            }
         }
         _loc7_ = 0;
         _loc8_ = int(this._6963.length);
         while(_loc7_ < _loc8_)
         {
            this._6963[_loc7_].height = this._6950;
            _loc5_ = _loc6_ + _loc7_ * _loc2_;
            if(_loc5_ > this._6951)
            {
               _loc5_ = 0;
               this._6963[_loc7_].visible = false;
            }
            else
            {
               this._6963[_loc7_].visible = true;
            }
            this._6963[_loc7_].x = _loc5_;
            _loc7_++;
         }
      }
      
      public function set _6923(param1:int) : void
      {
         this._6953 = param1;
      }
      
      public function set _6909(param1:int) : void
      {
         this._6895 = param1;
      }
      
      public function set index(param1:int) : void
      {
         this._6954 = param1;
      }
      
      public function set _6908(param1:int) : void
      {
         this._6894 = param1;
      }
   }
}

