package _97
{
   import _1374.TabGroup;
   import _1374.TabPanel;
   import _1374._1382;
   import _1376.BoxElement;
   import _1376._1379;
   import _1495._1494;
   import egret.core._1133;
   
   public class _96
   {
      public static var _2244:Object;
      
      public static var _2236:Object;
      
      public static var _2243:Function;
      
      public static var _2235:Function;
      
      public static var _2233:Function;
      
      public static var _2229:Function;
      
      public function _96()
      {
         super();
      }
      
      public static function _2234(param1:_1379, param2:int) : _1379
      {
         var _loc3_:_1379 = null;
         if(!param1)
         {
            return null;
         }
         if(param1._2250 == param2)
         {
            return param1;
         }
         if(param1 is BoxElement)
         {
            _loc3_ = _2234(BoxElement(param1)._2247,param2);
            if(_loc3_)
            {
               return _loc3_;
            }
            return _2234(BoxElement(param1)._2241,param2);
         }
         return null;
      }
      
      public static function _2239(param1:_1379, param2:_1379, param3:Boolean = false) : XML
      {
         var _loc6_:XML = null;
         var _loc4_:XML = _2238(param1,param3);
         var _loc5_:XML = _96._2240(_loc4_);
         if(_loc5_)
         {
            _loc6_ = _2232(param2,param3);
            _loc5_.appendChild(_loc6_);
         }
         return _loc4_;
      }
      
      public static function _2230(param1:_1382, param2:_1382, param3:XML) : void
      {
         var _loc4_:_1379 = _2237(param2,param3) as _1379;
         param1.addElement(_loc4_);
      }
      
      public static function _2228(param1:_1382, param2:XML) : void
      {
         var _loc3_:XML = _2240(param2);
         var _loc4_:_1379 = _2231(_loc3_.children()[0]);
         param1.addElement(_loc4_);
      }
      
      private static function _2240(param1:XML) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         if(param1.localName() == "Document")
         {
            return param1;
         }
         for each(_loc3_ in param1.children())
         {
            _loc2_ = _2240(_loc3_);
            if(_loc2_)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private static function _2238(param1:*, param2:Boolean = false) : XML
      {
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TabPanel = null;
         var _loc10_:XML = null;
         var _loc11_:String = null;
         var _loc12_:Array = null;
         var _loc3_:XML = <BoxElement/>;
         if(param1 is BoxElement)
         {
            _loc3_.setLocalName("BoxElement");
            _loc4_ = _2238(BoxElement(param1)._2247,param2);
            _loc3_.appendChild(_loc4_);
            _loc5_ = _2238(BoxElement(param1)._2241,param2);
            _loc3_.appendChild(_loc5_);
            if(BoxElement(param1)["isVertical"])
            {
               _loc3_.@isVertical = "true";
            }
            if(param2)
            {
               if((param1 as BoxElement)["percentSize"] != 0.5)
               {
                  _loc3_.@percentSize = (param1 as BoxElement).percentSize;
               }
            }
         }
         else if(param1 is TabGroup)
         {
            _loc3_.setLocalName("TabGroup");
            _loc6_ = TabGroup(param1)._2249;
            _loc7_ = Number(TabGroup(param1)["selectedIndex"]);
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc9_ = TabGroup(param1).getElementAt(_loc8_) as TabPanel;
               if(_loc9_)
               {
                  _loc10_ = _2238(_loc9_,param2);
                  _loc3_.appendChild(_loc10_);
                  if(_loc8_ != _loc7_)
                  {
                     if(_2233 != null)
                     {
                        _2233(_116._2246(_loc9_));
                     }
                  }
                  else if(_2235 != null)
                  {
                     _2235(_116._2246(_loc9_));
                  }
               }
               _loc8_++;
            }
            if(_loc7_ >= 0)
            {
               _loc3_.@selectedIndex = _loc7_;
            }
         }
         else if(param1 is _1382)
         {
            _loc3_.setLocalName("Document");
         }
         else if(param1 is TabPanel)
         {
            _loc3_.setLocalName("TabPanel");
            _loc11_ = _116._2246(param1);
            if((_loc12_ = _loc11_.split("::"))[1] == "TabPanel")
            {
               _loc3_.@title = TabPanel(param1).title;
            }
            else
            {
               _loc3_["@" + "content"] = _loc12_.join(".");
            }
         }
         if(param1 is _1379)
         {
            if(!isNaN(_1379(param1).width) && _1379(param1).width != 0 && !param2)
            {
               _loc3_.@width = _1379(param1).width;
            }
            if(!isNaN(_1379(param1).height) && _1379(param1).height != 0 && !param2)
            {
               _loc3_.@height = _1379(param1).height;
            }
            if(_1379(param1)["minimized"])
            {
               _loc3_.@minimized = "true";
            }
            if(_1379(param1)._2250 != -1)
            {
               _loc3_.@id = _1379(param1)._2250;
            }
         }
         return _loc3_;
      }
      
      private static function _2232(param1:*, param2:Boolean = false) : XML
      {
         if(!param1)
         {
            return null;
         }
         var _loc3_:XML = <TabGroup/>;
         if(param1 is _1379)
         {
            if(!isNaN(_1379(param1).width) && _1379(param1).width != 0 && !param2)
            {
               _loc3_.@width = _1379(param1).width;
            }
            if(!isNaN(_1379(param1).height) && _1379(param1).height != 0 && !param2)
            {
               _loc3_.@height = _1379(param1).height;
            }
            if(_1379(param1)["minimized"])
            {
               _loc3_.@minimized = "true";
            }
            if(_1379(param1)._2250 != -1)
            {
               _loc3_.@id = _1379(param1)._2250;
            }
         }
         return _loc3_;
      }
      
      private static function _2237(param1:_1382, param2:XML) : *
      {
         var _loc5_:Array = null;
         var _loc6_:XML = null;
         var _loc7_:TabPanel = null;
         var _loc8_:int = 0;
         var _loc9_:_1133 = null;
         if(!param2)
         {
            return null;
         }
         var _loc3_:Class = _2244[param2.localName()];
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:* = new _loc3_();
         if(_loc4_ is BoxElement)
         {
            (_loc4_ as BoxElement)._2247 = _2237(param1,param2.children()[0]);
            (_loc4_ as BoxElement)._2241 = _2237(param1,param2.children()[1]);
            (_loc4_ as BoxElement).isVertical = param2.@isVertical == "true";
            if(param2.hasOwnProperty("@percentSize"))
            {
               (_loc4_ as BoxElement).percentSize = Number(param2.@percentSize);
            }
         }
         else if(_loc4_ is TabGroup)
         {
            _loc5_ = [];
            for each(_loc6_ in param2.children())
            {
               _loc7_ = _2237(param1,_loc6_) as TabPanel;
               if(_loc7_)
               {
                  (_loc4_ as TabGroup).addElement(_loc7_);
                  _loc5_.push(_loc7_);
               }
            }
            if(param2.hasOwnProperty("@selectedIndex"))
            {
               _loc8_ = int(String(param2.@selectedIndex));
               if(_loc8_ >= 0 && _loc8_ < (_loc4_ as TabGroup)._2249)
               {
                  (_loc4_ as TabGroup).selectedIndex = _loc8_;
                  if(_2235 != null)
                  {
                     _2235(_116._2246(_loc5_[_loc8_]));
                  }
               }
            }
            if(_2229 != null)
            {
               _2229(_loc4_);
            }
         }
         else if(_loc4_ is _1382)
         {
            _loc4_ = param1;
         }
         else if(_loc4_ is TabPanel)
         {
            _loc9_ = _116.getInstance(param2.@content);
            if(_loc9_)
            {
               if(_loc9_ is TabPanel)
               {
                  _loc4_ = _loc9_ as TabPanel;
               }
               else if(_loc9_)
               {
                  (_loc4_ as TabPanel).addElement(_loc9_);
               }
               if(param2.hasOwnProperty("@title"))
               {
                  (_loc4_ as TabPanel).title = param2.@title;
               }
            }
         }
         if(_loc4_ is _1379)
         {
            if(param2.hasOwnProperty("@id"))
            {
               _1379(_loc4_)._2250 = param2.@id;
            }
            else
            {
               _1379(_loc4_)._2250 = _1494._1848();
            }
            if(param2.hasOwnProperty("@width"))
            {
               _1379(_loc4_).width = Number(param2.@width);
            }
            if(param2.hasOwnProperty("@height"))
            {
               _1379(_loc4_).height = Number(param2.@height);
            }
            _1379(_loc4_).minimized = param2.@minimized == "true";
         }
         return _loc4_;
      }
      
      private static function _2231(param1:XML) : _1379
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:Class = _2236[param1.localName()];
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:* = new _loc2_();
         if(_loc3_ is _1379)
         {
            if(param1.hasOwnProperty("@width"))
            {
               _1379(_loc3_).width = Number(param1.@width);
            }
            if(param1.hasOwnProperty("@height"))
            {
               _1379(_loc3_).height = Number(param1.@height);
            }
            _1379(_loc3_).minimized = param1.@minimized == "true";
            if(param1.hasOwnProperty("@id"))
            {
               _1379(_loc3_)._2250 = param1.@id;
            }
            else
            {
               _1379(_loc3_)._2250 = _1494._1848();
            }
         }
         return _loc3_;
      }
   }
}

