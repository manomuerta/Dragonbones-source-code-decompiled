package _1009
{
   import _1033._12500;
   import _1038._1039;
   import _1038._1042;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1088.ItemRenderer;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1185._1186;
   import _1185._1188;
   import _1185._1196;
   import _1185._1197;
   import _127._163;
   import _127._171;
   import _1374.IconButton;
   import _1404._1405;
   import _1404._1407;
   import _14097._14096;
   import _14097._14098;
   import _51._79;
   import _521._532;
   import _668._670;
   import _692._691;
   import _692._693;
   import _692._694;
   import _703._702;
   import _703._704;
   import _724._725;
   import _97._125;
   import egret.managers._1198;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   
   public class _14121 extends _171
   {
      public var _5554:Button;
      
      public var _5555:Button;
      
      private var _2541:Label;
      
      private var _5455:BitmapData;
      
      private var _14865:Group;
      
      public var _14552:_14096;
      
      private var _14947:Group;
      
      private const DEFAULT_TREE_WIDTH:Number = 236;
      
      public var tree:_163;
      
      private var _6362:_670;
      
      private var _14939:String;
      
      public function _14121()
      {
         super();
         this.title = tr("SwapImageWindow.newTitle");
         this.minWidth = 580;
         this.minHeight = 344;
         this.width = 580;
         this.height = 344;
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         super._2438();
         var _loc1_:_1186 = new _1186();
         _2512.layout = _loc1_;
         _2512.percentWidth = 100;
         _2512.percentHeight = 100;
         this._14491();
         this._14944();
         this._14945();
         this._2541 = new Label();
         this._2541.left = 15;
         this._2541.bottom = 15;
         _2512.addElement(this._2541);
         _loc2_ = new Group();
         _loc2_.percentWidth = 100;
         this._5554 = _125._2399();
         this._5554.label = tr("SwapImageWindow.replace");
         this._5555 = _125._2406();
         this._5555.right = 16;
         this._5554.right = 116;
         _loc2_.addElement(this._5554);
         _loc2_.addElement(this._5555);
         _loc2_.bottom = 10;
         _2632.bottom = 10;
         _2632.right = 20;
         var _loc3_:_12500 = new _12500();
         _loc3_.percentWidth = 100;
         _loc3_.bottom = 48;
         _2512.addElement(_loc3_);
         _2512.addElement(_loc2_);
         this._5572();
         this._14937();
         stage.focus = this.tree;
      }
      
      private function _14491() : void
      {
         var _loc1_:Number = 20;
         var _loc2_:Number = 20;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(5855326);
         _loc3_.graphics.drawRect(0,0,_loc2_ * 2,_loc2_ * 2);
         _loc3_.graphics.beginFill(6513256);
         _loc3_.graphics.drawRect(0,0,_loc2_,_loc2_);
         _loc3_.graphics.drawRect(_loc2_,_loc2_,_loc2_,_loc2_);
         _loc3_.graphics.endFill();
         if(!this._5455)
         {
            this._5455 = new BitmapData(_loc1_ * 2,_loc1_ * 2);
            this._5455.draw(_loc3_);
         }
      }
      
      private function _14944() : void
      {
         this._14865 = new Group();
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CENTER;
         _loc1_.verticalAlign = _1196.MIDDLE;
         this._14865.layout = _loc1_;
         this._14865.left = this._14865.top = 15;
         this._14552 = new _14096();
         this._14865.addElement(this._14552);
         _2512.addElement(this._14865);
      }
      
      private function _14945() : void
      {
         this._14947 = new Group();
         this._14947.top = 15;
         this._14947.right = 15;
         _2512.addElement(this._14947);
         this.tree = new _163();
         this.tree.percentWidth = 100;
         this.tree.percentHeight = 100;
         this.tree.doubleClickEnabled = true;
         this.tree._5987 = "name";
         this.tree.itemRenderer = _14098;
         this.tree.addEventListener(IndexChangeEvent.CHANGE,this._3552);
         this.tree.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._14938);
         this._14947.addElement(this.tree);
         this.tree._2490.addEventListener(RendererExistenceEvent.RENDERER_ADD,this._2603);
         this.tree.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2601);
      }
      
      private function _2603(param1:RendererExistenceEvent) : void
      {
         if(param1._2487 is ItemRenderer)
         {
            param1._2487.addEventListener(MouseEvent.MOUSE_MOVE,this._4089);
            param1._2487.addEventListener(MouseEvent.ROLL_OUT,this._9901);
         }
      }
      
      private function _9901(param1:MouseEvent = null) : void
      {
         this.reset();
      }
      
      private function _4089(param1:MouseEvent = null) : void
      {
         var _loc2_:ItemRenderer = null;
         if(Boolean(param1.target) && param1.target is IconButton)
         {
            this.reset();
            return;
         }
         if(param1 != null)
         {
            _loc2_ = param1.currentTarget as ItemRenderer;
         }
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.data is _693 || _loc2_.data is _694 || !(_loc2_.data is _691))
         {
            _1198.setCursor(_1405.DESKTOP_DISABLE);
            this.tree.addEventListener(IndexChangeEvent.CHANGING,this._4474);
         }
         else
         {
            this.reset();
         }
      }
      
      private function reset() : void
      {
         _1198.setCursor(_1405.AUTO);
         this.tree.removeEventListener(IndexChangeEvent.CHANGING,this._4474);
      }
      
      private function _4474(param1:IndexChangeEvent) : void
      {
         param1.preventDefault();
      }
      
      protected function _2601(param1:RendererExistenceEvent) : void
      {
         if(param1._2487 is ItemRenderer)
         {
            param1._2487.removeEventListener(MouseEvent.MOUSE_MOVE,this._4089);
            param1._2487.addEventListener(MouseEvent.ROLL_OUT,this._9901);
         }
      }
      
      private function _5572() : void
      {
         if(this.tree)
         {
            this.tree.dataProvider = !!this._6362 ? this._6362._3997 : null;
            if(this._6362)
            {
               this._6362._3997._4529(this._6362._3997.source);
            }
            if(this.tree.dataProvider)
            {
               (this.tree.dataProvider as _1042)._4505 = function(param1:Object):Boolean
               {
                  if(!(param1 as _704).visible || param1 is _694 && (param1 as _694).name != _6362._2871._2865.name)
                  {
                     return false;
                  }
                  return true;
               };
            }
         }
      }
      
      public function set _4158(param1:_670) : void
      {
         this._6362 = param1;
         this._5572();
      }
      
      public function _14937() : void
      {
         var _loc5_:_725 = null;
         var _loc1_:_532 = _1407.getInstance(_532) as _532;
         var _loc2_:_79 = _loc1_._3150;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_._2049.name;
         var _loc4_:_702 = this._14941(this._6362._4149._4162,_loc3_);
         if(_loc4_)
         {
            this.tree._2449();
            this.tree._4550(_loc4_);
            this.tree._2484 = _loc4_;
            _loc5_ = (_loc4_ as _691)._4204 as _725;
            this._14943(_loc5_);
         }
      }
      
      private function _14941(param1:_694, param2:String) : _702
      {
         var node:_702 = null;
         var libraryArmatureModel:_694 = param1;
         var displayName:String = param2;
         var getChildren:Function = function(param1:_702):void
         {
            var _loc2_:_702 = null;
            if(param1.vo && param1.vo.name && param1 is _691 && param1.vo.name == displayName)
            {
               node = param1;
            }
            if(Boolean(param1.children.length) && !node)
            {
               for each(_loc2_ in param1.children)
               {
                  getChildren(_loc2_);
               }
            }
         };
         if(libraryArmatureModel)
         {
            getChildren(libraryArmatureModel);
         }
         return node;
      }
      
      private function _14942(param1:ListEvent) : void
      {
         var _loc2_:_691 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         var _loc6_:Object = null;
         var _loc7_:_725 = null;
         if(!(param1.item is _693) && !(param1.item is _694) && param1.item is _691)
         {
            _loc2_ = param1.item as _691;
            _loc7_ = _loc2_._4204;
            this._14939 = _loc7_.path;
            this._14943(_loc7_);
         }
      }
      
      private function _14938(param1:ListEvent) : void
      {
         var _loc2_:_691 = null;
         var _loc3_:_725 = null;
         if(!(param1.item is _693) && !(param1.item is _694) && param1.item is _691)
         {
            _loc2_ = param1.item as _691;
            _loc3_ = _loc2_._4204;
            this._14939 = _loc3_.path;
            this.dispatchEvent(new ListEvent(ListEvent.ITEM_DOUBLE_CLICK,false));
         }
      }
      
      private function _3552(param1:IndexChangeEvent) : void
      {
         var _loc3_:_702 = null;
         var _loc4_:_691 = null;
         var _loc5_:_725 = null;
         var _loc2_:Vector.<Object> = this.tree._2889;
         if(_loc2_.length == 1)
         {
            _loc3_ = _loc2_[0] as _702;
         }
         if(!(_loc3_ is _693) && !(_loc3_ is _694) && _loc3_ is _691)
         {
            _loc4_ = _loc3_ as _691;
            _loc5_ = _loc4_._4204;
            this._14939 = _loc5_.path;
            this._14943(_loc5_);
         }
      }
      
      public function _14538(param1:_702) : void
      {
         var _loc2_:_691 = null;
         if(!(param1 is _691))
         {
            return;
         }
         _loc2_ = param1 as _691;
         var _loc3_:_725 = _loc2_._4204;
         this._14939 = _loc3_.path;
         this._14943(_loc3_);
      }
      
      private function _14943(param1:_725) : void
      {
         var _2104:_725 = param1;
         this._14552._2104 = _2104;
         this._14552.visible = false;
         this._14552._2104._2108(function(param1:BitmapData):void
         {
            var b:BitmapData = param1;
            _14552._6106(_14946());
            _99(function():void
            {
               _14552.visible = true;
            },null,1);
            _2541.text = tr("Property.canvas.size") + b.width + "x" + b.height;
         });
      }
      
      public function get _14548() : String
      {
         return this._14939;
      }
      
      private function _14946() : Number
      {
         var _loc1_:Number = this._14865.width / this._14552._7003;
         var _loc2_:Number = this._14865.height / this._14552._7002;
         var _loc3_:Number = Math.min(_loc1_,_loc2_);
         return _loc3_ > 1 ? 1 : _loc3_;
      }
      
      private function _14490(param1:Number, param2:Number) : void
      {
         var _loc3_:Matrix = new Matrix();
         var _loc4_:Number = 1;
         _loc3_.scale(_loc4_,_loc4_);
         var _loc5_:Graphics = this._14865.graphics;
         _loc5_.clear();
         _loc5_.beginBitmapFill(this._5455);
         _loc5_.drawRect(0,0,param1,param2);
         _loc5_.endFill();
      }
      
      private function _14940(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = this._14947.graphics;
         _loc3_.clear();
         this._14947.graphics.beginFill(0,1843496);
         this._14947.graphics.drawRect(0,0,param1,param2);
         this._14947.graphics.endFill();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         var _loc3_:Number = param1 - 290;
         var _loc4_:Number = param2 - 130;
         this._14865.width = _loc3_;
         this._14865.height = _loc4_;
         this._14490(_loc3_,_loc4_);
         this._14947.height = _loc4_;
         this._14947.width = this.DEFAULT_TREE_WIDTH;
         this._14940(this.DEFAULT_TREE_WIDTH,_loc4_);
         this._14552._6106(this._14946());
      }
      
      public function _14544() : void
      {
         if(this.tree)
         {
            (this.tree.dataProvider as _1042)._4505 = function(param1:Object):Boolean
            {
               if(!(param1 as _704).visible)
               {
                  return false;
               }
               return true;
            };
         }
      }
   }
}

