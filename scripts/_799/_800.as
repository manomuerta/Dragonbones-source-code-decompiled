package _799
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1085;
   import _1185._1196;
   import _1439._1269;
   import _54._67;
   import _73._72;
   import _790._795;
   
   public class _800 extends _1269
   {
      public var borderColor:uint = 3622226;
      
      public var textColor:uint = 16777215;
      
      public var _6057:Number = 30;
      
      public var title:Label;
      
      public var _6075:Label;
      
      public var _1799:Label;
      
      protected var rect:_1082;
      
      protected var shape:Group;
      
      public var _6072:_1082;
      
      public var _6069:_1082;
      
      public var _6068:_1082;
      
      protected var _6085:_1082;
      
      public var data:_67;
      
      protected var comicTree:_795;
      
      protected var _6079:_798;
      
      public function _800()
      {
         this.title = new Label();
         this._6075 = new Label();
         this._1799 = new Label();
         this.rect = new _1082();
         this.shape = new Group();
         this._6072 = new _1082();
         this._6069 = new _1082();
         this._6068 = new _1082();
         this._6085 = new _1082();
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         this.rect.right = 0;
         this.rect.top = 0;
         this.rect.bottom = 0;
         this.rect._2564 = 1;
         this.rect._2563 = this.borderColor;
         this.rect._2562 = 0.5;
         this.rect._2529 = 1;
         this.rect.fillColor = 1843496;
         addElement(this.rect);
         super._2438();
         labelDisplay.visible = false;
         this._6085.left = 0;
         this._6085.top = 0;
         this._6085.bottom = 0;
         this._6085._2529 = 1;
         this._6085.fillColor = 1843496;
         addElement(this._6085);
         this.shape.left = 0;
         this.shape.right = 0;
         this.shape.top = 0;
         this.shape.bottom = 0;
         addElement(this.shape);
         this._6072._2564 = 1;
         this._6072._2563 = this.borderColor;
         this._6072.left = 0;
         this._6072.top = 0;
         this._6072.height = 1;
         addElement(this._6072);
         this._6068._2564 = 1;
         this._6068._2563 = this.borderColor;
         this._6068.left = 0;
         this._6068.bottom = 0;
         this._6068.height = 1;
         addElement(this._6068);
         this._6069._2564 = 1;
         this._6069._2563 = this.borderColor;
         this._6069.width = 1;
         this._6069.left = 0;
         this._6069.top = -1;
         this._6069.bottom = 0;
         addElement(this._6069);
         this.title.verticalAlign = _1196.MIDDLE;
         this.title.textColor = this.textColor;
         addElement(this.title);
         this._6075.verticalCenter = 0;
         this._6075.textColor = this.textColor;
         this._6075._6080 = 1;
         addElement(this._6075);
         this._1799.verticalCenter = 0;
         this._1799.right = 10;
         this._1799.textColor = this.textColor;
         addElement(this._1799);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         this._6084();
         super._5823(param1,param2);
         this._1799.maxWidth = param1 * 0.75;
         this._1799.maxHeight = param2 * 0.9;
         this._6082();
         this._6083();
         this._6073();
         this._6078();
      }
      
      protected function _6084() : void
      {
         if(Boolean(_6081) && Boolean((_6081 as _798).comicTree))
         {
            this.comicTree = (_6081 as _798).comicTree;
            this._6057 = this.comicTree._6057;
            this.borderColor = this.comicTree.borderColor;
            this.textColor = this.comicTree.textColor;
            this.data = (_6081 as _798).data as _67;
         }
      }
      
      override public function set _6081(param1:_1085) : void
      {
         super._6081 = param1;
         if(param1)
         {
            this._6079 = _6081 as _798;
            this.width = _6081.width;
            this.height = _6081.height;
         }
      }
      
      protected function _6078() : void
      {
         if(Boolean(this._6079) && Boolean(this._6079.comicTree))
         {
            this.title.x = (this._6079.comicTree._6057 - this.title.width) * 0.5;
            this.title.height = this.height * this._6079._6064;
            this.title.y = -this._6079.index * this.height;
         }
      }
      
      protected function _6082() : void
      {
         this._6085.width = this._6057;
         this._6072.width = this._6057;
         this._6068.width = this._6057;
         this.rect.left = this._6057;
         this._6075.left = this._6057 + 10;
         if(_6081)
         {
            this._6075.width = _6081.width - this._6075.x - this._1799.width - this._1799.right - 5;
         }
         if(this._6079)
         {
            this._6072.visible = this._6079._6076;
            this._6068.visible = this._6079._6077;
         }
      }
      
      protected function _6083() : void
      {
         this.rect._2563 = this.borderColor;
         this._6072._2563 = this.borderColor;
         this._6068._2563 = this.borderColor;
         this._6069._2563 = this.borderColor;
         this.title.textColor = this.textColor;
         this._6075.textColor = this.textColor;
         this._1799.textColor = this.textColor;
      }
      
      protected function _6073() : void
      {
         var _loc2_:_72 = null;
         if(!this.data)
         {
            return;
         }
         this._6075.text = this.data.name;
         var _loc1_:String = "";
         for each(_loc2_ in this.data._2079)
         {
            _loc1_ += "+" + _72.actionHashObject[_loc2_.toString()];
         }
         this._1799.text = _72.actionHashObject[this.data.type.toString()] + _loc1_;
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.rect.fillColor = 1843496;
         }
         else if(_2080 == "over")
         {
            this.rect.fillColor = 1843496;
         }
         else if(_2080 == "down")
         {
            this.rect.fillColor = 2572105;
         }
      }
   }
}

