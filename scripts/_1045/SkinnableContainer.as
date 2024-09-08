package _1045
{
   import _1177.ElementExistenceEvent;
   import _1193._1192;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class SkinnableContainer extends _1085 implements _1134
   {
      public var _2440:Group;
      
      ns_egret var _8360:Group;
      
      private var _8358:Object;
      
      public function SkinnableContainer()
      {
         this._8358 = {};
         super();
      }
      
      ns_egret function get _8359() : Group
      {
         if(this._2440 == null)
         {
            if(this.ns_egret::_8360 == null)
            {
               this.ns_egret::_8360 = new Group();
            }
            this.ns_egret::_8360.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.ns_egret::_8357);
            this.ns_egret::_8360.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.ns_egret::_8356);
            return this.ns_egret::_8360;
         }
         return this._2440;
      }
      
      public function set elementsContent(param1:Array) : void
      {
         this.ns_egret::_8359.elementsContent = param1;
      }
      
      public function get _2249() : int
      {
         return this.ns_egret::_8359._2249;
      }
      
      public function getElementAt(param1:int) : _1133
      {
         return this.ns_egret::_8359.getElementAt(param1);
      }
      
      public function addElement(param1:_1133) : _1133
      {
         return this.ns_egret::_8359.addElement(param1);
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         return this.ns_egret::_8359.addElementAt(param1,param2);
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         return this.ns_egret::_8359.removeElement(param1);
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         return this.ns_egret::_8359.removeElementAt(param1);
      }
      
      public function _2426() : void
      {
         this.ns_egret::_8359._2426();
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         return this.ns_egret::_8359.getElementIndex(param1);
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this.ns_egret::_8359.setElementIndex(param1,param2);
      }
      
      public function swapElements(param1:_1133, param2:_1133) : void
      {
         this.ns_egret::_8359.swapElements(param1,param2);
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         this.ns_egret::_8359.swapElementsAt(param1,param2);
      }
      
      public function _8171(param1:_1133) : Boolean
      {
         return this.ns_egret::_8359._8171(param1);
      }
      
      public function get layout() : _1192
      {
         return this._2440 != null ? this._2440.layout : this._8358.layout;
      }
      
      public function set layout(param1:_1192) : void
      {
         if(this._2440 != null)
         {
            this._2440.layout = param1;
         }
         else
         {
            this._8358.layout = param1;
         }
      }
      
      public function get autoLayout() : Boolean
      {
         var _loc1_:* = undefined;
         if(this._2440)
         {
            return this._2440.autoLayout;
         }
         _loc1_ = this._8358.autoLayout;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         if(this._2440)
         {
            this._2440.autoLayout = param1;
         }
         else
         {
            this._8358.autoLayout = param1;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         super.partAdded(param1,param2);
         if(param2 == this._2440)
         {
            if(this._8358.layout !== undefined)
            {
               this._2440.layout = this._8358.layout;
            }
            if(this._8358.autoLayout !== undefined)
            {
               this._2440.layout = this._8358.autoLayout;
            }
            this._8358 = {};
            if(this.ns_egret::_8360)
            {
               this.ns_egret::_8360.removeEventListener(ElementExistenceEvent.ELEMENT_ADD,this.ns_egret::_8357);
               this.ns_egret::_8360.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.ns_egret::_8356);
               _loc3_ = this.ns_egret::_8360.ns_egret::_7409().concat();
               _loc4_ = this.ns_egret::_8360._2249;
               while(_loc4_ > 0)
               {
                  this.ns_egret::_8360.removeElementAt(0);
                  _loc4_--;
               }
               this._2440.elementsContent = _loc3_;
               this.ns_egret::_8360 = null;
            }
            this._2440.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.ns_egret::_8357);
            this._2440.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.ns_egret::_8356);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._2440)
         {
            this._2440.removeEventListener(ElementExistenceEvent.ELEMENT_ADD,this.ns_egret::_8357);
            this._2440.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.ns_egret::_8356);
            this._8358.layout = this._2440.layout;
            this._8358.autoLayout = this._2440.autoLayout;
            this._2440.layout = null;
            if(this._2440._2249 > 0)
            {
               this.ns_egret::_8360 = new Group();
               while(this._2440._2249 > 0)
               {
                  this.ns_egret::_8360.addElement(this._2440.getElementAt(0));
               }
               this.ns_egret::_8360.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.ns_egret::_8357);
               this.ns_egret::_8360.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.ns_egret::_8356);
            }
         }
      }
      
      ns_egret function _8357(param1:ElementExistenceEvent) : void
      {
         param1.element._6967(this);
         dispatchEvent(param1);
      }
      
      ns_egret function _8356(param1:ElementExistenceEvent) : void
      {
         param1.element._6967(null);
         dispatchEvent(param1);
      }
   }
}

