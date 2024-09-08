package _978
{
   import _1045._1069;
   import _1045._1070;
   import _1045._1082;
   import _676._690;
   import _97._100;
   
   public class _990 extends _1082 implements _1070, _1069
   {
      private var _data:Object;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _6953:int;
      
      private var _6895:int;
      
      private var _6894:int;
      
      private var _6954:int;
      
      public function _990()
      {
         super();
         this.width = 1;
         this.fillColor = _100.LABEL_KEY_COLOR;
         this.height = Timeline.LABEL_KEY_HEIGHT;
         this.y = Timeline.LABEL_HEIGHT - Timeline.LABEL_KEY_HEIGHT - 1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         var _loc2_:_690 = _690(this._data);
         if(_loc2_)
         {
            this._6953 = Timeline._6923;
            this._6895 = Timeline._6909;
            this._6894 = Timeline._6908;
            this._6954 = Timeline.index;
            if(this._6954 <= _loc2_.frameIndex)
            {
               this.visible = true;
               this.x = (_loc2_.frameIndex - this._6954) / this._6894 * this._6953 + Timeline.LABEL_GAP;
            }
            else
            {
               this.visible = false;
            }
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:_690 = _690(this._data);
         if(_loc1_)
         {
            this._6953 = Timeline._6923;
            this._6895 = Timeline._6909;
            this._6894 = Timeline._6908;
            this._6954 = Timeline.index;
            if(this._6954 <= _loc1_.frameIndex)
            {
               this.visible = true;
               this.x = (_loc1_.frameIndex - this._6954) / this._6894 * this._6953 + Timeline.LABEL_GAP;
            }
            else
            {
               this.visible = false;
            }
         }
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

