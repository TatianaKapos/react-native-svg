/**
 * Copyright (c) 2015-present, Horcrux.
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNSVGTextPath.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import <React/RCTConversions.h>
#import <React/RCTFabricComponentsPlugins.h>
#import <react/renderer/components/view/conversions.h>
#import <rnsvg/RNSVGComponentDescriptors.h>
#import "RNSVGFabricConversions.h"
#endif // RCT_NEW_ARCH_ENABLED

@implementation RNSVGTextPath

#ifdef RCT_NEW_ARCH_ENABLED
using namespace facebook::react;

// Needed because of this: https://github.com/facebook/react-native/pull/37274
+ (void)load
{
  [super load];
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RNSVGTextPathProps>();
    _props = defaultProps;
  }
  return self;
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RNSVGTextPathComponentDescriptor>();
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &newProps = static_cast<const RNSVGTextPathProps &>(*props);

  self.href = RCTNSStringFromStringNilIfEmpty(newProps.href);
  self.side = RCTNSStringFromStringNilIfEmpty(newProps.side);
  self.method = RCTNSStringFromStringNilIfEmpty(newProps.method);
  self.midLine = RCTNSStringFromStringNilIfEmpty(newProps.midLine);
  self.spacing = RCTNSStringFromStringNilIfEmpty(newProps.spacing);
  id startOffset = RNSVGConvertFollyDynamicToId(newProps.startOffset);
  if (startOffset != nil) {
    self.startOffset = [RCTConvert RNSVGLength:startOffset];
  }

  setCommonTextProps(newProps, self);
  _props = std::static_pointer_cast<RNSVGTextPathProps const>(props);
}

- (void)prepareForRecycle
{
  [super prepareForRecycle];

  _href = nil;
  _side = nil;
  _method = nil;
  _midLine = nil;
  _spacing = nil;
  _startOffset = nil;
}
#endif // RCT_NEW_ARCH_ENABLED

- (void)setHref:(NSString *)href
{
  if ([href isEqualToString:_href]) {
    return;
  }
  [self invalidate];
  _href = href;
}

- (void)setSide:(NSString *)side
{
  if ([side isEqualToString:_side]) {
    return;
  }
  [self invalidate];
  _side = side;
}

- (void)setMethod:(NSString *)method
{
  if ([method isEqualToString:_method]) {
    return;
  }
  [self invalidate];
  _method = method;
}

- (void)setMidLine:(NSString *)midLine
{
  if ([midLine isEqualToString:_midLine]) {
    return;
  }
  [self invalidate];
  _midLine = midLine;
}

- (void)setSpacing:(NSString *)spacing
{
  if ([spacing isEqualToString:_spacing]) {
    return;
  }
  [self invalidate];
  _spacing = spacing;
}

- (void)setStartOffset:(RNSVGLength *)startOffset
{
  if ([startOffset isEqualTo:_startOffset]) {
    return;
  }
  [self invalidate];
  _startOffset = startOffset;
}

- (void)renderLayerTo:(CGContextRef)context rect:(CGRect)rect
{
  [self renderGroupTo:context rect:rect];
}

- (CGPathRef)getPath:(CGContextRef)context
{
  return [self getGroupPath:context];
}

- (void)pushGlyphContext
{
  // TextPath do not affect the glyphContext
}

- (void)popGlyphContext
{
  // TextPath do not affect the glyphContext
}

@end

#ifdef RCT_NEW_ARCH_ENABLED
Class<RCTComponentViewProtocol> RNSVGTextPathCls(void)
{
  return RNSVGTextPath.class;
}
#endif // RCT_NEW_ARCH_ENABLED
