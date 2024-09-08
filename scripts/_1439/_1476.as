package _1439
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1185._1196;
   import _1374.TextInput;
   
   public class _1476 extends _1084
   {
      public var _9775:TextInput;
      
      public var labelDisplay:Label;
      
      private var rect:_1082;
      
      private var _10055:Group;
      
      public function _1476()
      {
         super();
         this.minWidth = this.minHeight = 12;
         this.height = 23;
         this.states = ["normal","prompt","edit","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.rect = new _1082();
         this.rect.fillColor = 1975081;
         this.rect._2564 = 1;
         this.rect._2562 = 1;
         this.rect._2563 = 1646115;
         this.rect.right = this.rect.bottom = 1;
         this.rect.top = this.rect.left = 0;
         this.addElement(this.rect);
         this._10055 = new Group();
         this._10055.percentWidth = this._10055.percentHeight = 100;
         this.addElement(this._10055);
         this._9775 = new TextInput();
         this._9775.restrict = "0-9.\\-";
         this._9775.verticalCenter = 0;
         this._9775.percentWidth = this._9775.percentHeight = 100;
         this._10055.addElement(this._9775);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay.percentHeight = this.labelDisplay.percentWidth = 100;
         this.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.labelDisplay.textColor = 16711422;
         if(_2080 == "edit")
         {
            this._10055.visible = true;
            this.labelDisplay.visible = false;
         }
         else if(_2080 == "prompt")
         {
            this._10055.visible = false;
            this.labelDisplay.visible = true;
            this.labelDisplay.textColor = 6580589;
         }
         else
         {
            this._10055.visible = false;
            this.labelDisplay.visible = true;
         }
      }
   }
}

