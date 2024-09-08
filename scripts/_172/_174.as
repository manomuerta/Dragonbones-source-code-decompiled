package _172
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1188;
   import _1185._1197;
   import _1374.TextInput;
   import flash.events.Event;
   
   public class _174 extends Dialog
   {
      private var textInput:TextInput;
      
      private var _2650:Label;
      
      private var _2645:Label;
      
      private var _2649:Function;
      
      private var _2647:String;
      
      private var _2652:String;
      
      private var _value:String = "";
      
      public function _174()
      {
         super();
         this.minWidth = 350;
      }
      
      protected function _2646() : void
      {
         if(this._2651 != null)
         {
            this._2648 = this._2651(this.textInput.text);
         }
         else
         {
            this._2648 = null;
         }
         if(!this._2648)
         {
            this.value = this.textInput.text;
         }
      }
      
      override protected function _2556(param1:String) : void
      {
         if(param1 == _173.OK_ID)
         {
            this.value = this.textInput.text;
         }
         else
         {
            this.value = null;
         }
         super._2556(param1);
      }
      
      override protected function _2634() : void
      {
         super._2634();
         var _loc1_:Button = _2641(_173.OK_ID);
         if(_loc1_)
         {
            _loc1_.enabled = this._2648 == null;
         }
      }
      
      override protected function _2635() : Group
      {
         var vLayout:_1197;
         var group:Group = null;
         group = super._2635();
         group.percentWidth = 100;
         vLayout = new _1197();
         vLayout._2401 = _1188.CONTENT_JUSTIFY;
         vLayout.padding = 10;
         vLayout.gap = 5;
         group.layout = vLayout;
         this._2650 = new Label();
         this._2650.text = this._2653;
         group.addElement(this._2650);
         this.textInput = new TextInput();
         this.textInput.text = this.value;
         this.textInput.addEventListener(Event.CHANGE,function(param1:Event):void
         {
            _2646();
         },true);
         group.addElement(this.textInput);
         this._2646();
         this.textInput._2581();
         this.textInput.selectAll();
         this._2645 = new Label();
         this._2645.text = "test";
         group.addElement(this._2645);
         this._2645._2449();
         this._2645.minHeight = this._2645.layoutBoundsHeight;
         this._2645.text = this._2648;
         return group;
      }
      
      public function get _2651() : Function
      {
         return this._2649;
      }
      
      public function set _2651(param1:Function) : void
      {
         this._2649 = param1;
      }
      
      public function get _2648() : String
      {
         return this._2647;
      }
      
      public function set _2648(param1:String) : void
      {
         this._2647 = param1;
         if(this._2645)
         {
            this._2645.text = param1;
         }
         var _loc2_:Button = _2641(_173.OK_ID);
         if(_loc2_)
         {
            _loc2_.enabled = this._2648 == null;
         }
      }
      
      public function get _2653() : String
      {
         return this._2652;
      }
      
      public function set _2653(param1:String) : void
      {
         this._2652 = param1;
         if(this._2650)
         {
            this._2650.text = param1;
         }
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set value(param1:String) : void
      {
         this._value = param1;
         if(this.textInput)
         {
            this.textInput.text = param1;
         }
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(param1);
         this.textInput._2581();
         this.textInput.selectAll();
      }
   }
}

