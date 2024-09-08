package _935
{
   import _1045.Group;
   import _1045.RadioButton;
   import _1045._1081;
   import flash.events.Event;
   
   public class _13217 extends Group
   {
      public static const LEFT_TOP:String = "LEFT_TOP";
      
      public static const LEFT_MIDDLE:String = "LEFT_MIDDLE";
      
      public static const LEFT_BOTTOM:String = "LEFT_BOTTOM";
      
      public static const MIDDLE_TOP:String = "MIDDLE_TOP";
      
      public static const MIDDLE_MIDDLE:String = "MIDDLE_MIDDLE";
      
      public static const MIDDLE_BOTTOM:String = "MIDDLE_BOTTOM";
      
      public static const RIGHT_TOP:String = "RIGHT_TOP";
      
      public static const RIGHT_MIDDLE:String = "RIGHT_MIDDLE";
      
      public static const RIGHT_BOTTOM:String = "RIGHT_BOTTOM";
      
      public var _13444:RadioButton;
      
      public var _13441:RadioButton;
      
      public var _13440:RadioButton;
      
      public var _13442:RadioButton;
      
      public var _13436:RadioButton;
      
      public var _13437:RadioButton;
      
      public var _13443:RadioButton;
      
      public var _13439:RadioButton;
      
      public var _13438:RadioButton;
      
      private var _5918:_1081;
      
      public function _13217()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         super._2438();
         _loc1_ = 8;
         this._5918 = new _1081();
         this._13444 = new RadioButton();
         this._13444.skinName = _13218;
         this._13444.group = this._5918;
         this._13441 = new RadioButton();
         this._13441.skinName = _13218;
         this._13441.group = this._5918;
         this._13440 = new RadioButton();
         this._13440.skinName = _13218;
         this._13440.group = this._5918;
         this._13442 = new RadioButton();
         this._13442.skinName = _13218;
         this._13442.group = this._5918;
         this._13436 = new RadioButton();
         this._13436.skinName = _13218;
         this._13436.group = this._5918;
         this._13437 = new RadioButton();
         this._13437.skinName = _13218;
         this._13437.group = this._5918;
         this._13443 = new RadioButton();
         this._13443.skinName = _13218;
         this._13443.group = this._5918;
         this._13439 = new RadioButton();
         this._13439.skinName = _13218;
         this._13439.group = this._5918;
         this._13438 = new RadioButton();
         this._13438.skinName = _13218;
         this._13438.group = this._5918;
         this._13444.x = 0;
         this._13444.y = 0;
         this._13441.x = 0;
         this._13441.y = _loc1_;
         this._13440.x = 0;
         this._13440.y = _loc1_ * 2;
         this._13442.x = _loc1_;
         this._13442.y = 0;
         this._13436.x = _loc1_;
         this._13436.y = _loc1_;
         this._13437.x = _loc1_;
         this._13437.y = _loc1_ * 2;
         this._13443.x = _loc1_ * 2;
         this._13443.y = 0;
         this._13439.x = _loc1_ * 2;
         this._13439.y = _loc1_;
         this._13438.x = _loc1_ * 2;
         this._13438.y = _loc1_ * 2;
         this._13444.value = LEFT_TOP;
         this._13441.value = LEFT_MIDDLE;
         this._13440.value = LEFT_BOTTOM;
         this._13442.value = MIDDLE_TOP;
         this._13436.value = MIDDLE_MIDDLE;
         this._13437.value = MIDDLE_BOTTOM;
         this._13443.value = RIGHT_TOP;
         this._13439.value = RIGHT_MIDDLE;
         this._13438.value = RIGHT_BOTTOM;
         addElement(this._13444);
         addElement(this._13441);
         addElement(this._13440);
         addElement(this._13442);
         addElement(this._13436);
         addElement(this._13437);
         addElement(this._13443);
         addElement(this._13439);
         addElement(this._13438);
         this._5918._5568 = MIDDLE_MIDDLE;
         this._5918.addEventListener(Event.CHANGE,this._6406);
      }
      
      private function _6406(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      public function get value() : String
      {
         return this._5918._5568 as String;
      }
      
      public function set value(param1:String) : void
      {
         this._5918._5568 = param1;
      }
      
      public function clear() : void
      {
         this._5918._5568 = null;
      }
   }
}

