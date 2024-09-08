package _978
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1069;
   import _1045._1070;
   import _1045._1082;
   import _97._100;
   import flash.text.TextFormatAlign;
   
   public class _989 extends Group implements _1070, _1069
   {
      public static const LONG_LINE_HEIGHT:int = 38;
      
      public static const SHORT_LINE_HEIGHT:int = 16;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      public var frameLabel:Label;
      
      public var _6973:_1082;
      
      private var _data:Object;
      
      private var _6975:int;
      
      public function _989()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:_988 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this._data = param1;
         _loc2_ = _988(owner);
         var _loc6_:int = _loc2_._2775;
         this.frameLabel.text = "";
         this.frameLabel.y = Timeline.LABEL_HEIGHT - LONG_LINE_HEIGHT - 2 - 20;
         if(_loc2_)
         {
            _loc3_ = _loc2_._6923;
            _loc4_ = _loc2_._6908;
            _loc5_ = _loc2_._6909;
         }
         if(_loc5_ == 1)
         {
            this._6107();
            this._6974(this._2540 * _loc4_ + _loc6_);
         }
         else if((this._2540 + _loc6_ / _loc4_) % _loc5_ == 0)
         {
            this._6107();
            this._6974(this._2540 * _loc4_ + _loc6_);
         }
         else
         {
            this._6107(true);
         }
         if(this._2540 + _loc6_ == 0)
         {
            this.frameLabel.text = "0";
         }
         if(_loc2_ && _loc2_._13845 < _loc2_._13843 && _loc2_._13845 >= 0)
         {
            if(this._6975 > _loc2_._13845 && this._6975 < _loc2_._13843)
            {
               this.frameLabel.textColor = _100.TIMELINE_LABEL_LOOP_COLOR;
            }
            else
            {
               this.frameLabel.textColor = _100.TIMELINE_LABEL_TEXT_COLOR;
            }
         }
         else
         {
            this.frameLabel.textColor = _100.TIMELINE_LABEL_TEXT_COLOR;
         }
         this.x = this._2540 * _loc3_;
      }
      
      private function _6107(param1:Boolean = false) : void
      {
         if(param1)
         {
            this._6973.height = SHORT_LINE_HEIGHT;
            this._6973.y = Timeline.LABEL_HEIGHT - SHORT_LINE_HEIGHT - 2;
         }
         else
         {
            this._6973.height = LONG_LINE_HEIGHT;
            this._6973.y = Timeline.LABEL_HEIGHT - LONG_LINE_HEIGHT - 2;
         }
      }
      
      private function _6974(param1:int) : void
      {
         if(param1 > 0)
         {
            this._6975 = param1;
            this.frameLabel.text = String(param1);
         }
         else
         {
            this.frameLabel.text = "";
         }
      }
      
      private function get textWidth() : int
      {
         return this.frameLabel.text.length * 10;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.frameLabel = new Label();
         this.frameLabel.mouseEnabled = false;
         this.frameLabel.mouseChildren = false;
         this.frameLabel.textColor = _100.TIMELINE_LABEL_TEXT_COLOR;
         this.frameLabel.width = 50;
         this.frameLabel.x = -24;
         this.frameLabel.textAlign = TextFormatAlign.CENTER;
         this.frameLabel.y = 10;
         this._6973 = new _1082();
         this._6973.mouseEnabled = false;
         this._6973.mouseChildren = false;
         this._6973.fillColor = _100.TIMELINE_LABEL_COLOR;
         this._6973.width = 1;
         addElement(this._6973);
         addElement(this.frameLabel);
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
      }
   }
}

