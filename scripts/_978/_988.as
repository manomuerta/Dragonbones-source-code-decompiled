package _978
{
   import _1038._1037;
   import _1045.Group;
   import _1045._1082;
   import _636.TimelineEvent;
   import _97._100;
   
   public class _988 extends Group
   {
      public static const MAX_GAP:int = 40;
      
      public static const MIN_GAP:int = 10;
      
      public static const TWO_LABEL_GAP:int = 25;
      
      public static const FIVE_LABEL_GAP:int = 15;
      
      public const ZOOM_RATE:Number = 0.8;
      
      private var _6951:int;
      
      private var _6894:int;
      
      private var _6895:int;
      
      private var _6965:Number;
      
      private var _6953:int;
      
      private var _6954:int;
      
      private var _6969:Number;
      
      private var _6971:int;
      
      private var _data:_1037;
      
      private var _6972:Vector.<_989>;
      
      private var _6877:_1037;
      
      public var bg:_1082;
      
      private var _3688:Number;
      
      private var _6968:Group;
      
      private var _6966:int;
      
      public var _13845:int = -1;
      
      public var _13843:int = -1;
      
      public function _988()
      {
         this.SCALE_LEVEL = [1,2,4,10,20];
         this.LABEL_LEVEL = [1,2,5];
         super();
         this._6972 = new Vector.<_989>();
         this._data = new _1037([]);
         this._6953 = MAX_GAP;
         Timeline._6923 = this._6953;
         this._6894 = 0;
         this._6895 = 0;
         this._6969 = MIN_GAP / (MAX_GAP * this.SCALE_LEVEL[this.SCALE_LEVEL.length - 1]);
         this.bg = new _1082();
         this.index = 0;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6968 = new Group();
         this.bg.fillColor = _100.TIMELINE_LABEL_BG_COLOR;
         this.bg._2563 = _100.TIMELINE_LABEL_STROKE_COLOR;
         this.bg._2564 = 1;
         this.bg.height = Timeline.LABEL_HEIGHT;
         this.bg.width = this._6951;
         addElement(this._6968);
         this._4718 = 1;
      }
      
      public function get _6916() : int
      {
         return this._6951;
      }
      
      public function get _6190() : int
      {
         return this._6951 - MAX_GAP;
      }
      
      public function set _6916(param1:int) : void
      {
         var _loc4_:_989 = null;
         this._6951 = param1;
         this.bg.width = this._6951;
         var _loc2_:int = Math.ceil(this._6951 / this._6953);
         var _loc3_:int = int(this._6972.length);
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new _989()).itemIndex = _loc3_;
            this._6972.push(_loc4_);
            _loc3_++;
         }
         this._6971 = _loc2_;
         this._data.source.length = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this._6971)
         {
            this._data.source.push(_loc5_);
            _loc5_++;
         }
         this.dataProvider = this._data;
      }
      
      public function _6883(param1:int) : int
      {
         param1 -= Timeline.LABEL_GAP;
         param1 += this._6953 / this._6894 / 2;
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc2_:int = param1 % this._6953;
         var _loc3_:int = param1 / this._6953;
         return _loc3_ * this._6894 + int(_loc2_ / this._6953 * this._6894) + this._6954;
      }
      
      public function _6796(param1:int) : int
      {
         return int(this._6953 / this._6894 * (param1 - this._6954)) + Timeline.LABEL_GAP;
      }
      
      public function get _4718() : Number
      {
         return this._6965;
      }
      
      public function get _6254() : Number
      {
         return this._6953 / this._6894;
      }
      
      public function set _4718(param1:Number) : void
      {
         if(param1 < this._6969)
         {
            param1 = this._6969;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         if(this._6965 == param1)
         {
            return;
         }
         this._6965 = param1;
         var _loc2_:Number = MAX_GAP * this._6965;
         var _loc3_:int = 0;
         while(_loc2_ < MIN_GAP && _loc3_ < this.SCALE_LEVEL.length)
         {
            _loc3_++;
            _loc2_ = MAX_GAP * this._6965 * this.SCALE_LEVEL[_loc3_];
         }
         if(_loc3_ >= this.SCALE_LEVEL.length)
         {
            _loc3_ = int(this.SCALE_LEVEL.length - 1);
         }
         if(_loc3_ > 0)
         {
            this._6895 = this.LABEL_LEVEL[2];
         }
         else if(_loc2_ > TWO_LABEL_GAP)
         {
            this._6895 = this.LABEL_LEVEL[0];
         }
         else if(_loc2_ > FIVE_LABEL_GAP)
         {
            this._6895 = this.LABEL_LEVEL[1];
         }
         else
         {
            this._6895 = this.LABEL_LEVEL[2];
         }
         this._6894 = this.SCALE_LEVEL[_loc3_];
         this._6953 = int(_loc2_);
         Timeline._6923 = this._6953;
         Timeline._6909 = this._6895;
         Timeline._6908 = this._6894;
         this._6964();
         this._6916 = this._6951;
         dispatchEvent(new TimelineEvent(TimelineEvent.SCALE_CHANGE));
      }
      
      public function get _6923() : int
      {
         return this._6953;
      }
      
      public function get _6908() : int
      {
         return this._6894;
      }
      
      public function get _6909() : int
      {
         return this._6895;
      }
      
      public function set dataProvider(param1:_1037) : void
      {
         this._6877 = param1;
         var _loc2_:int = int(this._6877.source.length);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._6972.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc3_ < _loc2_)
            {
               if(!this._6972[_loc3_].parent)
               {
                  this._6968.addElement(this._6972[_loc3_]);
                  this._6972[_loc3_]._6967(this);
               }
               this._6972[_loc3_].data = this._6877.source[_loc3_];
               this._6972[_loc3_].visible = true;
            }
            else
            {
               this._6972[_loc3_].x = 0;
               this._6972[_loc3_].visible = false;
            }
            _loc3_++;
         }
      }
      
      public function refresh() : void
      {
         this.dataProvider = this._data;
      }
      
      public function get index() : int
      {
         return this._6954;
      }
      
      public function set index(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._6954 != param1)
         {
            this._6954 = param1;
            if(this._6894 > 1 && this._6954 > 0)
            {
               this._6966 = this._6954 + (this._6894 - this._6954 % this._6894);
            }
            else
            {
               this._6966 = this._6954;
            }
            this._3688 = (this._6966 - this._6954) * this._6953 / this._6894;
            this._6968.x = Timeline.LABEL_GAP + this._3688;
            this.refresh();
            this.dispatchEvent(new TimelineEvent(TimelineEvent._5619));
         }
      }
      
      private function _6964() : void
      {
         if(this._6894 > 1 && this._6954 > 0)
         {
            this._6966 = this._6954 + (this._6894 - this._6954 % this._6894);
         }
         else
         {
            this._6966 = this._6954;
         }
         this._3688 = (this._6966 - this._6954) * this._6953 / this._6894;
         this._6968.x = Timeline.LABEL_GAP + this._3688;
         this.refresh();
      }
      
      public function get _2775() : int
      {
         return this._6966;
      }
      
      public function get _6970() : Number
      {
         return this._6969;
      }
      
      public function zoomIn() : void
      {
         var _loc1_:Number = this._6965;
         _loc1_ *= this.ZOOM_RATE;
         this._4718 = _loc1_;
      }
      
      public function zoomOut() : void
      {
         var _loc1_:Number = this._6965;
         _loc1_ /= this.ZOOM_RATE;
         this._4718 = _loc1_;
      }
      
      public function gotoFrame(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = this._6796(param1);
         if(_loc2_ < Timeline.LABEL_GAP)
         {
            _loc3_ = _loc2_ - Timeline.LABEL_GAP;
         }
         else if(_loc2_ > this._6951 - MAX_GAP)
         {
            _loc3_ = _loc2_ - (this._6951 - MAX_GAP);
         }
         if(_loc3_ != 0)
         {
            _loc4_ = _loc3_ / this._6953 * this._6894;
         }
         this.index += _loc4_;
      }
   }
}

